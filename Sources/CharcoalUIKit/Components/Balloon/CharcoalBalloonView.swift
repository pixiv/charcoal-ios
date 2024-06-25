import UIKit

class CharcoalBalloonView: UIView, CharcoalAnchorable {
    lazy var label: CharcoalTypography14 = {
        let label = CharcoalTypography14()
        label.numberOfLines = 0
        label.isBold = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text5.color
        return label
    }()

    let text: String

    let bubbleShape: CharcoalBubbleShape

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 16

    /// The height of the arrow
    let arrowHeight: CGFloat = 4

    /// The width of the arrow
    let arrowWidth: CGFloat = 7

    /// The max width of the tooltip
    let maxWidth: CGFloat

    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

    /// Text frame size
    private var textFrameSize: CGSize = .zero

    init(text: String, targetPoint: CGPoint, maxWidth: CGFloat = 184) {
        bubbleShape = CharcoalBubbleShape(targetPoint: targetPoint, arrowHeight: arrowHeight, bubbleRadius: cornerRadius, arrowWidth: arrowWidth, fillColor: CharcoalAsset.ColorPaletteGenerated.brand.color, strokeColor: UIColor.white, lineWidth: 2)
        self.maxWidth = maxWidth
        self.text = text
        super.init(frame: .zero)
        textFrameSize = text.calculateFrame(font: label.font, maxWidth: maxWidth)
        setupLayer()
    }

    func updateTargetPoint(point: CGPoint) {
        bubbleShape.targetPoint = point
        setNeedsLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayer() {
        // Setup Bubble Shape
        layer.addSublayer(bubbleShape)
        // Setup Label
        addSubview(label)
        label.text = text
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        textFrameSize = text.calculateFrame(font: label.font, maxWidth: maxWidth)
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: padding.left + textFrameSize.width + padding.right, height: padding.top + textFrameSize.height + padding.bottom)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleShape.frame = bounds
        label.frame = CGRect(x: padding.left, y: padding.top, width: textFrameSize.width, height: textFrameSize.height)
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.backgroundColor = UIColor.lightGray
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let tooltip = CharcoalBalloonView(text: "Hello World", targetPoint: CGPoint(x: 15, y: -5))

    let tooltip2 = CharcoalBalloonView(text: "Hello World This is a tooltip", targetPoint: CGPoint(x: 110, y: 10))

    let tooltip3 = CharcoalBalloonView(text: "here is testing it's multiple line feature", targetPoint: CGPoint(x: 50, y: 55))

    let tooltip4 = CharcoalBalloonView(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", targetPoint: CGPoint(x: -10, y: 25))

    stackView.addArrangedSubview(tooltip)
    stackView.addArrangedSubview(tooltip2)
    stackView.addArrangedSubview(tooltip3)
    stackView.addArrangedSubview(tooltip4)

    return stackView
}
