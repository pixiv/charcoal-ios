import SwiftUI

struct CharcoalOverlayContainerModifier: ViewModifier {
    @ObservedObject var viewManager = CharcoalContainerManager()
    
    func body(content: Content) -> some View {
        content
            .overlay(
                CharcoalOverlayContainer().ignoresSafeArea()
            )
            .environmentObject(viewManager)
    }
}

typealias CharcoalPopupView = View & Equatable

struct CharcoalOverlayContainerChild<SubContent: CharcoalPopupView>: ViewModifier {
    @EnvironmentObject var viewManager: CharcoalContainerManager
    
    @Binding var isPresenting: Bool
    
    var view: SubContent
    
    let viewID: UUID
    
    func createOverlayView(view: SubContent) -> CharcoalIdentifiableOverlayView {
        return CharcoalIdentifiableOverlayView(id: viewID, contentView: AnyView(view), isPresenting: $isPresenting)
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresenting) { newValue in
                if newValue {
                    let newView = createOverlayView(view: view)
                    viewManager.addView(view: newView)
                }
            }
            .onChange(of: view) { newValue in
                if isPresenting {
                    let newView = createOverlayView(view: view)
                    viewManager.addView(view: newView)
                }
            }
            .onAppear {
                // onAppear is needed if the overlay is presented by default
                let newView = createOverlayView(view: view)
                viewManager.addView(view: newView)
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
            Color.clear.allowsHitTesting(false)
            
            ForEach(viewManager.overlayViews, id: \.id) { overlayView in
                overlayView
            }
        }
    }
}
