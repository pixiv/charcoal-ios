import SwiftUI

public struct BackgroundTransparentView: UIViewRepresentable {
    public func makeUIView(context _: Context) -> UIView {
        TransparentView()
    }
    
    public func updateUIView(_: UIView, context _: Context) {}
    
    private class TransparentView: UIView {
        override func layoutSubviews() {
            super.layoutSubviews()
            superview?.superview?.backgroundColor = .clear
        }
    }
}
