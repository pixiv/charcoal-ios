import SwiftUI

struct BackgroundTransparentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        DispatchQueue.main.async {
            // viewが紐づくUIHostingViewの背景色を透過させることでfullScreenCoverで表示した際に背景を透過させられる
            // SwiftUI._UIHostingView<SwiftUI.AnyView>
            view.superview?.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.2)

            // viewが紐づいているPresentationHostingControllerのmodalTransitionStyleをcrossDissolveにしておくことで、fullScreenCoverを閉じるときのアニメーションを標準のslideから変更できる
            // SwiftUI.PresentationHostingController<SwiftUI.AnyView>
            (view.superview?.superview?.next as? UIViewController)?.modalTransitionStyle = .crossDissolve
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
