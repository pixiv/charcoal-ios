import SwiftUI

struct CharcoalOverlayContainerModifier: ViewModifier {
    @Environment(\.overlayContainerManager) var manager
    
    func body(content: Content) -> some View {
        content
            .overlay(
                CharcoalOverlayContainer(viewManager: self.manager)
            )
    }
}

struct CharcoalOverlayContainerChild: ViewModifier {
    @Environment(\.overlayContainerManager) var manager
    @Binding var isPresenting: Bool
    var view: AnyView
    
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
    }
}

public extension View {
    func charcoalOverlayContainer() -> some View {
        modifier(CharcoalOverlayContainerModifier())
    }
    
    func charcoalSpinner(
        isPresenting: Binding<Bool>,
        spinnerSize: CGFloat = 48,
        transparentBackground: Bool = false
    ) -> some View {
        return modifier(CharcoalOverlayContainerChild(isPresenting: isPresenting, view: AnyView(CharcoalSpinner(spinnerSize: spinnerSize, transparentBackground: transparentBackground))))
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
