import UIKit

class CharcoalTooltipView: UIView, CharcoalAnchorable {
    lazy var label: CharcoalTypography12 = {
        let label = CharcoalTypography12()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CharcoalFoundation.Colors.textOnPrimaryDefault.value
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

    init(text: String, targetPoint: CGPoint, maxWidth: CGFloat = 184) {
        bubbleShape = CharcoalBubbleShape(targetPoint: targetPoint, arrowHeight: arrowHeight, bubbleRadius: cornerRadius, arrowWidth: arrowWidth)
        self.maxWidth = maxWidth
        self.text = text
        super.init(frame: .zero)
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

        label.preferredMaxLayoutWidth = maxWidth - padding.left - padding.right

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left),
            label.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        ])

        setNeedsLayout()
    }

    override var intrinsicContentSize: CGSize {
        let labelSize = label.intrinsicContentSize
        return CGSize(width: padding.left + labelSize.width + padding.right, height: padding.top + labelSize.height + padding.bottom)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleShape.frame = bounds
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
