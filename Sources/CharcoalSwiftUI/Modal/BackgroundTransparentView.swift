import SwiftUI

// fullScreenCoverで背景透過するためのView
struct BackgroundTransparentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.2)

            // viewが紐づいているViewControllerのmodalTransitionStyleをcrossDissolveにしておくことで、presentされたviewを閉じるときのアニメーションが自然になるようにしている
            let vc = firstAvailableUIViewController(from: view)
            vc?.modalTransitionStyle = .crossDissolve
        }
        return view
    }

    private func firstAvailableUIViewController(from view: UIView) -> UIViewController? {
        var responder = view.next
        while responder != nil {
            if responder is UIViewController {
                return responder as? UIViewController
            }
            responder = responder?.next
        }
        return nil
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
