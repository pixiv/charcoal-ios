import UIKit

class CharcoalTooltipView: UIView {
    
    let bubbleShape: TooltipBubbleShape
    
    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 4

    /// The height of the arrow
    let arrowHeight: CGFloat = 3

    init(text: String, targetFrame: CGRect, maxWidth: CGFloat = 184) {
        self.bubbleShape = TooltipBubbleShape(targetPoint: .zero, arrowHeight: 3, bubbleRadius: 4, arrowWidth: 7)
        super.init(frame: .zero)
        self.layer.addSublayer(self.bubbleShape)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayer() {
    }

    private func startAnimating() {

    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bubbleShape.frame = self.bounds
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let tooltip = CharcoalTooltipView(text: "Hello", targetFrame: CGRect.zero)

    stackView.addArrangedSubview(tooltip)

    return stackView
}
