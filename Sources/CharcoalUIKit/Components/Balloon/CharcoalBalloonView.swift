import UIKit

class CharcoalBalloonView: UIView, CharcoalAnchorable {
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var label: CharcoalTypography14 = {
        let label = CharcoalTypography14()
        label.numberOfLines = 0
        label.isBold = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text5.color
        return label
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        let label = CharcoalTypography14()
        label.isBold = true
        button.titleLabel?.font = label.font
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIColor.black.withAlphaComponent(0.35).image(), for: .normal)
        button.setBackgroundImage(UIColor.black.withAlphaComponent(0.39).image(), for: .highlighted)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
        button.clipsToBounds = true
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        let closeImage = CharcoalAsset.Images.remove16.image.withRenderingMode(.alwaysTemplate)

        button.setImage(closeImage, for: .normal)
        // This empty title is necessary to make the button baseline align with the label
        button.setTitle("", for: .normal)
        button.titleLabel?.font = CharcoalTypography14().font
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var labelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    let action: CharcoalAction?

    let text: String

    let bubbleShape: CharcoalBubbleShape

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 16

    /// The height of the arrow
    let arrowHeight: CGFloat = 5

    /// The width of the arrow
    let arrowWidth: CGFloat = 7

    /// The max width of the tooltip
    let maxWidth: CGFloat

    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    
    let closeButtonSize = 20.0

    /// Text frame size
    private var textFrameSize: CGSize = .zero

    init(text: String, targetPoint: CGPoint, maxWidth: CGFloat = 240, action: CharcoalAction? = nil) {
        bubbleShape = CharcoalBubbleShape(targetPoint: targetPoint, arrowHeight: arrowHeight, bubbleRadius: cornerRadius, arrowWidth: arrowWidth, fillColor: CharcoalAsset.ColorPaletteGenerated.brand.color, strokeColor: UIColor.white, lineWidth: 2)
        self.action = action
        self.maxWidth = maxWidth
        self.text = text
        super.init(frame: .zero)
        setupLayer()
        addTextLabel()
        addActionButton()
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
        
        addSubview(vStackView)
        NSLayoutConstraint.activate([
            vStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStackView.topAnchor.constraint(equalTo: topAnchor),
            vStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStackView.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth)
        ])

    }
    
    private func addTextLabel() {
        vStackView.addArrangedSubview(labelContainer)

        labelContainer.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: padding.left),
            label.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: padding.top),
            label.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant: -padding.bottom)
        ])

        label.text = text
        label.preferredMaxLayoutWidth = preferredTextMaxWidth
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        let labelFrame = label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        // Label's frame might smaller than line height
        // In this case, we need to adjust the offset
        var offset = 0.0
        
        if labelFrame.height < label.lineHeight {
            offset = (label.lineHeight - labelFrame.height)/2.0
        }

        labelContainer.addSubview(closeButton)
        NSLayoutConstraint.activate([
            // Make sure the label's height is at least the line height
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: label.lineHeight),
            closeButton.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: -padding.right),
            closeButton.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor, constant: offset),
            closeButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: padding.right),
            closeButton.widthAnchor.constraint(equalToConstant: closeButtonSize),
            closeButton.heightAnchor.constraint(equalToConstant: closeButtonSize)
        ])
        
        setNeedsLayout()
    }
    
    func addActionButton() {
        if let action = action {
            vStackView.addArrangedSubview(buttonContainer)
            
            actionButton.setTitle(action.title, for: .normal)
            actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
            buttonContainer.addSubview(actionButton)
            
            NSLayoutConstraint.activate([
                actionButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor),
                actionButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor),
                actionButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor),
                actionButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: -padding.bottom)
            ])
            
            actionButton.sizeToFit()
        }
        
    }

    @objc func actionButtonTapped() {
        action?.actionCallback()
    }
    /// The max width of the text label
    var preferredTextMaxWidth: CGFloat {
        let width = maxWidth - padding.left - padding.right - closeButtonSize - padding.right
        return width
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleShape.frame = bounds
        
        actionButton.layer.cornerRadius = actionButton.frame.height / 2.0
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

    let tooltip = CharcoalBalloonView(text: "Hello World", targetPoint: CGPoint(x: 15, y: -5), action: CharcoalAction(title: "詳しく", actionCallback: {
        print("Clicked on the action button")
    }))

    let tooltip2 = CharcoalBalloonView(text: "Hello World This is a tooltip", targetPoint: CGPoint(x: 110, y: 10))

    let tooltip3 = CharcoalBalloonView(text: "here is testing it's multiple line feature", targetPoint: CGPoint(x: 50, y: 55))

    let tooltip4 = CharcoalBalloonView(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", targetPoint: CGPoint(x: -10, y: 25))
    
    let tooltip5 = CharcoalBalloonView(text: "こんにちは", targetPoint: CGPoint(x: -10, y: 25))

    stackView.addArrangedSubview(tooltip)
    stackView.addArrangedSubview(tooltip2)
    stackView.addArrangedSubview(tooltip3)
    stackView.addArrangedSubview(tooltip4)
    stackView.addArrangedSubview(tooltip5)

    return stackView
}
