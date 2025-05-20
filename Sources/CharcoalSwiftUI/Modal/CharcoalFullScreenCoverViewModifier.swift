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
                let scene = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
                    .filter { $0.activationState == .foregroundActive }
                    .first
                if let windowScene = scene {
                    if newValue {
                        hostingViewController = UIHostingController(rootView: subContent())

                        if let hostingViewController, let rootViewController = windowScene.windows.filter({ $0.isKeyWindow }).first?.rootViewController {
                            hostingViewController.overrideUserInterfaceStyle = rootViewController.traitCollection.userInterfaceStyle
                            hostingViewController.view.backgroundColor = UIColor.clear
                            hostingViewController.modalPresentationStyle = .overFullScreen
                            let presenter = { (vc : UIViewController) -> UIViewController in
                                var topmost = vc
                                while let presentedViewController = topmost.presentedViewController {
                                    topmost = presentedViewController
                                }
                                return topmost
                            }(rootViewController)
                            presenter.present(hostingViewController, animated: false)
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
