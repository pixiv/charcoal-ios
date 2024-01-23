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
    
    func body(content: Content) -> some View {
        content
            .onChange(of: isPresenting) { newValue in
                if (newValue) {
                    manager.addView(view: view)
                    manager.isPresenting = true
                } else {
                    manager.isPresenting = false
                    manager.removeView()
                }
            }
            .onChange(of: view) { newValue in
                manager.addView(view: view)
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
            if let view = viewManager.overlayView {
                if viewManager.isPresenting {
                    view
                }
            }
        }
        .animation(.spring, value: viewManager.isPresenting)
        .onDisappear { viewManager.removeView() }
    }
}
