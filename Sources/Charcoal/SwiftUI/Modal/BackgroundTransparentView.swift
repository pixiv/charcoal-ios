import SwiftUI

struct BackgroundTransparentView: UIViewRepresentable {
    func makeUIView(context _: Context) -> UIView {
        TransparentView()
    }

    func updateUIView(_: UIView, context _: Context) {}

    private class TransparentView: UIView {
        override func layoutSubviews() {
            super.layoutSubviews()
            superview?.superview?.backgroundColor = .clear
        }
    }
}
