import UIKit

class CharcoalSnackBarView: UIView {
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

    lazy var label: CharcoalTypography14 = {
        let label = CharcoalTypography14()
        label.numberOfLines = 1
        label.isBold = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text1.color
        return label
    }()

    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    lazy var actionButton: CharcoalDefaultSButton = {
        let button = CharcoalDefaultSButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let thumbnailImage: UIImage?

    var action: CharcoalAction?

    let text: String

    lazy var capsuleShape: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.layer.cornerCurve = .continuous
        return view
    }()

    /// The corner radius of the snackbar
    let cornerRadius: CGFloat = 32

    let borderColor: ColorAsset.Color

    let borderLineWidth: CGFloat = 1

    /// The max width of the snackbar
    let maxWidth: CGFloat

    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

    var gesture: UIGestureRecognizer?

    var animator: CharcoalRubberAnimator?

    init(text: String, thumbnailImage: UIImage? = nil, maxWidth: CGFloat = 312, action: CharcoalAction? = nil) {
        self.action = action
        self.thumbnailImage = thumbnailImage
        self.maxWidth = maxWidth
        self.text = text
        borderColor = CharcoalAsset.ColorPaletteGenerated.border.color
        super.init(frame: .zero)
        if let action = action {
            actionButton.setTitle(action.title, for: .normal)
        }
        setupLayer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCapsuleShape() {
        addSubview(capsuleShape)
        backgroundColor = CharcoalAsset.ColorPaletteGenerated.background1.color
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderLineWidth
        layer.masksToBounds = true
        layer.cornerCurve = .continuous
    }

    private func addThumbnailView() {
        if let thumbnailImage = thumbnailImage {
            thumbnailImageView.image = thumbnailImage
            hStackView.addArrangedSubview(thumbnailImageView)
            NSLayoutConstraint.activate([
                thumbnailImageView.widthAnchor.constraint(equalToConstant: 64),
                thumbnailImageView.heightAnchor.constraint(equalToConstant: 64)
            ])
        }
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
        if let _ = action {
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

    private func setupLayer() {
        // Setup Bubble Shape
        setupCapsuleShape()

        // Add HStack
        addSubview(hStackView)
        NSLayoutConstraint.activate([
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStackView.topAnchor.constraint(equalTo: topAnchor),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStackView.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth)
        ])

        // Add thumbnail view
        addThumbnailView()

        // Add text label with padding view
        addTextLabel()

        // Add action button
        addActionButton()
    }

    @objc func actionButtonTapped() {
        action?.actionCallback()
    }

    /// The max width of the text label
    var preferredTextMaxWidth: CGFloat {
        var width = maxWidth - padding.left - padding.right

        // Check if has thumbnail image
        if let _ = thumbnailImage {
            width = width - 64
        }

        // Check if has action button
        if let _ = action {
            width = width - actionButton.intrinsicContentSize.width - padding.right
        }

        return width
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        capsuleShape.frame = bounds
        layer.cornerRadius = min(cornerRadius, bounds.height / 2.0)
    }

    /// Add gesture to this view
    func setupGestureAnimator(_ screenEdge: CharcoalPopupViewEdge, gestureDismissCallback: ActionCallback?) {
        let gesture = UIPanGestureRecognizer()
        let animator = CharcoalRubberAnimator(screenEdge: screenEdge)
        animator.dismiss = gestureDismissCallback
        gesture.addTarget(animator, action: #selector(CharcoalRubberAnimator.handlePan(_:)))

        addGestureRecognizer(gesture)

        self.animator = animator
        self.gesture = gesture
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        /// cgColor needs manually update if targeting iOS 17
        layer.borderColor = borderColor.cgColor
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let snackbar = CharcoalSnackBarView(text: "Hello World")

    let snackbar2 = CharcoalSnackBarView(text: "ブックマークしました", thumbnailImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64))

    let snackbar3 = CharcoalSnackBarView(text: "ブックマークしました", action: CharcoalAction(title: "編集", actionCallback: {
        print("編集 taped")
    }))

    let snackbar4 = CharcoalSnackBarView(
        text: "こんにちは This is a snackbar and here is testing it's multiple line feature",
        thumbnailImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64),
        action: CharcoalAction(title: "編集", actionCallback: {
            print("編集 taped")
        })
    )

    let snackbar5 = CharcoalSnackBarView(text: "こんにちは This is a snackbar and here is testing it's multiple line feature")

    stackView.addArrangedSubview(snackbar)
    stackView.addArrangedSubview(snackbar2)
    stackView.addArrangedSubview(snackbar3)
    stackView.addArrangedSubview(snackbar4)
    stackView.addArrangedSubview(snackbar5)

    return stackView
}

func printColorComponents(of color: UIColor) {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0

    // Extract the RGBA components
    if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
        print(String(format: "Red: %.2f, Green: %.2f, Blue: %.2f, Alpha: %.2f", red, green, blue, alpha))
    } else {
        print("Failed to retrieve color components.")
    }
}
