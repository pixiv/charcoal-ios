import SwiftUI

struct CharcoalFullScreenCoverViewModifier<SubContent: View>: ViewModifier {
    @Binding var isPresented: Bool

    @ViewBuilder var subContent: () -> SubContent

    var duration: Double

    @State var hostingViewController: UIHostingController<SubContent>? = nil

    init(isPresented: Binding<Bool>, duration: Double, @ViewBuilder subContent: @escaping () -> SubContent) {
        _isPresented = isPresented
        self.subContent = subContent
        self.duration = duration
    }

    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { newValue in
                let scene = UIApplication.shared.connectedScenes.first
                if let windowScene = scene as? UIWindowScene {
                    if newValue {
                        hostingViewController = UIHostingController(rootView: subContent())

                        if let hostingViewController {
                            hostingViewController.view.backgroundColor = UIColor.clear
                            hostingViewController.modalPresentationStyle = .overFullScreen
                            windowScene.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(hostingViewController, animated: false)
                        }
                    } else {
                        Task {
                            // Wait for the dismiss animation to finish
                            try await Task.sleep(nanoseconds: UInt64(self.duration * 1000) * 1000000)
                            hostingViewController?.dismiss(animated: false)
                        }
                    }
                }
            }
    }
}

extension View {
    func charcoalFullScreenCover<SubContent: View>(isPresented: Binding<Bool>, duration: Double = 0.25, @ViewBuilder content: @escaping () -> SubContent) -> some View {
        modifier(CharcoalFullScreenCoverViewModifier(isPresented: isPresented, duration: duration, subContent: content))
    }
}
