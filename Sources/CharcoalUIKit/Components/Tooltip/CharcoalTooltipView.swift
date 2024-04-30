import UIKit

class CharcoalTooltipView: UIView {
    
    lazy var label: CharcoalTypography12 = {
        let label = CharcoalTypography12()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text5.color
        return label
    }()
    
    let text: String
    
    let bubbleShape: CharcoalBubbleShape
    
    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 4

    /// The height of the arrow
    let arrowHeight: CGFloat = 3
    
    /// The width of the arrow
    let arrowWidth: CGFloat = 5
    
    /// The max width of the tooltip
    let maxWidth: CGFloat
    
    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12)
    
    /// Text frame size
    private var textFrameSize: CGSize = .zero

    init(text: String, targetPoint: CGPoint, maxWidth: CGFloat = 184) {
        self.bubbleShape = CharcoalBubbleShape(targetPoint: targetPoint, arrowHeight: arrowHeight, bubbleRadius: cornerRadius, arrowWidth: arrowWidth)
        self.maxWidth = maxWidth
        self.text = text
        super.init(frame: .zero)
        self.textFrameSize = text.calculateFrame(font: label.font, maxWidth: maxWidth)
        self.setupLayer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayer() {
        // Setup Bubble Shape
        self.layer.addSublayer(self.bubbleShape)
        // Setup Label
        addSubview(label)
        label.text = text
    }

    private func startAnimating() {

    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        self.textFrameSize = text.calculateFrame(font: label.font, maxWidth: maxWidth)
    }

    override var intrinsicContentSize: CGSize {
        self.textFrameSize = text.calculateFrame(font: label.font, maxWidth: maxWidth)
        return CGSize(width: padding.left + textFrameSize.width + padding.right, height: padding.top + textFrameSize.height + padding.bottom)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bubbleShape.frame = self.bounds
        self.label.frame = CGRect(x: padding.left, y: padding.top, width: textFrameSize.width, height: textFrameSize.height)
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let tooltip = CharcoalTooltipView(text: "Hello World", targetPoint: CGPoint(x: 15, y: -5))
    
    let tooltip2 = CharcoalTooltipView(text: "Hello World This is a tooltip", targetPoint: CGPoint(x: 110, y: 10))
    
    let tooltip3 = CharcoalTooltipView(text: "here is testing it's multiple line feature", targetPoint: CGPoint(x: 50, y: 55))
    
    let tooltip4 = CharcoalTooltipView(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", targetPoint: CGPoint(x: -10, y: 25))

    stackView.addArrangedSubview(tooltip)
    stackView.addArrangedSubview(tooltip2)
    stackView.addArrangedSubview(tooltip3)
    stackView.addArrangedSubview(tooltip4)

    return stackView
}
