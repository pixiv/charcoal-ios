import UIKit

class CharcoalTooltipView: UIView {
    
    let bubbleShape: TooltipBubbleShape
    
    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 4

    /// The height of the arrow
    let arrowHeight: CGFloat = 3
    
    /// The width of the arrow
    let arrowWidth: CGFloat = 5

    init(text: String, targetPoint: CGPoint, maxWidth: CGFloat = 184) {
        self.bubbleShape = TooltipBubbleShape(targetPoint: targetPoint, arrowHeight: arrowHeight, bubbleRadius: cornerRadius, arrowWidth: arrowWidth)
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

    let tooltip = CharcoalTooltipView(text: "Hello", targetPoint: CGPoint(x: 15, y: -5))
    
    let tooltip2 = CharcoalTooltipView(text: "Hello", targetPoint: CGPoint(x: 110, y: 10))
    
    let tooltip3 = CharcoalTooltipView(text: "Hello", targetPoint: CGPoint(x: 50, y: 55))
    
    let tooltip4 = CharcoalTooltipView(text: "Hello", targetPoint: CGPoint(x: -10, y: 25))

    stackView.addArrangedSubview(tooltip)
    stackView.addArrangedSubview(tooltip2)
    stackView.addArrangedSubview(tooltip3)
    stackView.addArrangedSubview(tooltip4)

    return stackView
}
