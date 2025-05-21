import SwiftUI

struct BackgroundTransparentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        DispatchQueue.main.async {
            // viewが紐づくUIHostingViewの背景色を透過させることでfullScreenCoverで表示した際に背景を透過させられる
            // SwiftUI._UIHostingView<SwiftUI.AnyView>
            view.superview?.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.2)

            // SwiftUI.PresentationHostingController<SwiftUI.AnyView> を取り出す
            // iOS 17以前は SwiftUI._UIHostingView<SwiftUI.AnyView>のnextResponderはSwiftUI.PresentationHostingControllerになっているが
            // iOS 18以降だと SwiftUI._UIHostingView<SwiftUI.AnyView> -> SwiftUI.UIKitKeyPressResponder -> SwiftUI.PresentationHostingController になるため、whileループをしている
            var responder: UIResponder? = view.superview?.superview?.next
            while responder != nil {
                guard let responder, let vc = responder as? UIViewController else {
                    responder = responder?.next
                    continue
                }
                // viewが紐づいているPresentationHostingControllerのmodalTransitionStyleをcrossDissolveにしておくことで、fullScreenCoverを閉じるときのアニメーションを標準のslideから変更できる
                vc.modalTransitionStyle = .crossDissolve
                break
            }
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
