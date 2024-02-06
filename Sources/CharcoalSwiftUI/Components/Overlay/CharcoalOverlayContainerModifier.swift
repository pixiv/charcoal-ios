import SwiftUI

struct CharcoalOverlayContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                CharcoalOverlayContainer().ignoresSafeArea()
            )
    }
}

typealias CharcoalPopupView = View & Equatable

struct CharcoalOverlayContainerChild<SubContent: CharcoalPopupView>: ViewModifier {
    
    var viewManager = CharcoalContainerManager.share
    @Binding var isPresenting: Bool
    
    var view: SubContent
    
    let viewID: UUID
    
    func createOverlayView(view: SubContent) -> CharcoalIdentifiableOverlayView {
        return CharcoalIdentifiableOverlayView(id: viewID, contentView: AnyView(view), isPresenting: $isPresenting)
    }
    
    init(isPresenting: Binding<Bool>, view: SubContent, viewID: UUID) {
        _isPresenting = isPresenting
        self.view = view
        self.viewID = viewID
        
        let newView = createOverlayView(view: view)
        let viewManager = viewManager
        Task {
            await viewManager.addView(view: newView)
        }
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
        
    }
}

public extension View {
    func charcoalOverlayContainer() -> some View {
        modifier(CharcoalOverlayContainerModifier())
    }
}

struct CharcoalOverlayContainer: View {
    
    @ObservedObject var viewManager = CharcoalContainerManager.share
    
    var body: some View {
        ZStack {
            Color.clear.allowsHitTesting(false)
            
            ForEach(viewManager.overlayViews, id: \.id) { overlayView in
                overlayView
            }
        }
        .onDisappear {
            viewManager.clear()
        }
    }
}
