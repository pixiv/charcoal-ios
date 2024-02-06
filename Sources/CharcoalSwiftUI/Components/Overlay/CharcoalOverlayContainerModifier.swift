import SwiftUI

struct CharcoalOverlayContainerModifier: ViewModifier {
    @Environment(\.overlayContainerManager) var manager
    
    func body(content: Content) -> some View {
        content
            .overlay(
                CharcoalOverlayContainer(viewManager: self.manager).ignoresSafeArea()
            )
    }
}

typealias CharcoalPopupView = View & Equatable

struct CharcoalOverlayContainerChild<SubContent: CharcoalPopupView>: ViewModifier {
    @Environment(\.overlayContainerManager) var manager
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
        
        manager.addView(view: createOverlayView(view: view))
    }
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresenting) { newValue in
                if newValue {
                    manager.addView(view:  createOverlayView(view: view))
                } else {
                    manager.removeView(id: viewID)
                }
            }
            .onChange(of: view) { newValue in
                manager.addView(view: createOverlayView(view: view))
            }
    }
}

public extension View {
    func charcoalOverlayContainer() -> some View {
        modifier(CharcoalOverlayContainerModifier())
    }
}

struct CharcoalOverlayContainerChildModifier: ViewModifier {
    @Environment(\.overlayContainerManager) var manager
    
    func body(content: Content) -> some View {
        content
            .overlay(
                CharcoalOverlayContainer(viewManager: self.manager)
            )
    }
}

struct CharcoalOverlayContainer: View {
    
    @ObservedObject var viewManager: CharcoalContainerManager
    
    var body: some View {
        ZStack {
            Color.clear.allowsHitTesting(false)
            
            ForEach(viewManager.overlayViews, id: \.id) { overlayView in
                overlayView
            }
        }
        .onDisappear { viewManager.clear() }
    }
}
