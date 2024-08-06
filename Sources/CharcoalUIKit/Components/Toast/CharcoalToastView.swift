import UIKit

class CharcoalToastView: UIView {
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var labelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    lazy var label: CharcoalTypography14 = {
        let label = CharcoalTypography14()
        label.numberOfLines = 0
        label.isBold = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text5.color
        return label
    }()

    let text: String

    /// The appearance of the Toast
    let appearance: CharcoalToastAppearance

    lazy var capsuleShape: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.layer.cornerCurve = .continuous
        return view
    }()

    /// The corner radius of the toast
    let cornerRadius: CGFloat = 32

    let borderColor: ColorAsset.Color

    let borderLineWidth: CGFloat = 2

    /// The max width of the toast
    let maxWidth: CGFloat

    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
    
    var actionCallback: ActionCallback?

    init(text: String, maxWidth: CGFloat = 312, appearance: CharcoalToastAppearance = .success, action: ActionCallback? = nil) {
        self.maxWidth = maxWidth
        self.text = text
        self.appearance = appearance
        self.actionCallback = action
        borderColor = CharcoalAsset.ColorPaletteGenerated.background1.color
        super.init(frame: .zero)
        
        if let action = action {
            actionButton.setImage(CharcoalAsset.Images.remove16.image.withRenderingMode(.alwaysTemplate), for: .normal)
        }
        
        setupLayer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayer() {
        // Setup Bubble Shape
        addSubview(capsuleShape)
        capsuleShape.backgroundColor = appearance.background
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderLineWidth
        layer.masksToBounds = true
        layer.cornerCurve = .continuous
        
        // Add HStack
        addSubview(hStackView)
        NSLayoutConstraint.activate([
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStackView.topAnchor.constraint(equalTo: topAnchor),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStackView.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth)
        ])
        
        addTextLabel()
        
        addActionButton()
    }
    
    private func addTextLabel() {
        hStackView.addArrangedSubview(labelContainer)

        labelContainer.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor, constant: padding.left),
            label.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor, constant: -padding.right),
            label.topAnchor.constraint(equalTo: labelContainer.topAnchor, constant: padding.top),
            label.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor, constant: -padding.bottom)
        ])

        label.text = text
        label.preferredMaxLayoutWidth = preferredTextMaxWidth
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    private func addActionButton() {
        if let _ = actionCallback {
            actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
            actionButton.alpha = 1
            hStackView.addArrangedSubview(buttonContainer)
            buttonContainer.addSubview(actionButton)

            NSLayoutConstraint.activate([
                actionButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor),
                actionButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: -padding.right),
                actionButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor, constant: padding.top),
                actionButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: -padding.bottom)
            ])
        }
    }
    
    @objc func actionButtonTapped() {
        actionCallback?()
    }
    
    /// The max width of the text label
    var preferredTextMaxWidth: CGFloat {
        var width = maxWidth - padding.left - padding.right

        // Check if has action button
        if let _ = actionCallback {
            width = width - actionButton.intrinsicContentSize.width - padding.right
        }

        return width
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        capsuleShape.frame = bounds
        layer.cornerRadius = min(cornerRadius, bounds.height / 2.0)
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let toast = CharcoalToastView(text: "Hello World")

    let toast2 = CharcoalToastView(text: "Hello World This is a toast", appearance: .error)

    let toast3 = CharcoalToastView(text: "here is testing it's multiple line feature")

    let toast4 = CharcoalToastView(text: "こんにちは This is a toast and here is testing it's multiple line feature") {
        print("Button Tapped")
    }

    stackView.addArrangedSubview(toast)
    stackView.addArrangedSubview(toast2)
    stackView.addArrangedSubview(toast3)
    stackView.addArrangedSubview(toast4)

    return stackView
}
