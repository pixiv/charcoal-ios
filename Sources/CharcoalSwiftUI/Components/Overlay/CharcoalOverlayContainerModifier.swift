import SwiftUI

struct CharcoalOverlayContainerModifier: ViewModifier {
    @StateObject var viewManager = CharcoalContainerManager()

    func body(content: Content) -> some View {
        content
            .overlay(
                CharcoalOverlayContainer().ignoresSafeArea()
            )
            .environmentObject(viewManager)
    }
}

typealias CharcoalPopupView = Equatable & Identifiable & View

struct CharcoalOverlayContainerChild<SubContent: CharcoalPopupView>: ViewModifier {
    @EnvironmentObject var viewManager: CharcoalContainerManager

    @Binding var isPresenting: Bool

    let view: SubContent

    let viewID: UUID

    func createOverlayView(view: SubContent) -> CharcoalIdentifiableOverlayView {
        return CharcoalIdentifiableOverlayView(id: viewID, contentView: AnyView(view))
    }
    
    func updateView(view: SubContent)  {
        viewManager.addView(view: createOverlayView(view: view))
    }

    func body(content: Content) -> some View {
        content
            .onChange(of: isPresenting) { newValue in
                if newValue {
                    updateView(view: view)
                }
            }
            .onChange(of: view) { newValue in
                if isPresenting {
                    updateView(view: newValue)
                }
            }
            .onAppear {
                // onAppear is needed if the overlay is presented by default
                updateView(view: view)
            }
    }
}

public extension View {
    func charcoalOverlayContainer() -> some View {
        modifier(CharcoalOverlayContainerModifier())
    }
}

struct CharcoalOverlayContainer: View {
    @EnvironmentObject var viewManager: CharcoalContainerManager

    var body: some View {
        ZStack {
            Color.clear

            ForEach(viewManager.overlayViews, id: \.id) { overlayView in
                overlayView
            }
        }.onDisappear {
            viewManager.clear()
        }
    }
}
