import UIKit

public typealias ActionCallback = () -> Void

public struct CharcoalAction {
    let title: String
    let actionCallback: ActionCallback
}

class CharcoalSnackBarView: UIView {
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var label: CharcoalTypography14 = {
        let label = CharcoalTypography14()
        label.numberOfLines = 1
        label.isBold = true
        label.translatesAutoresizingMaskIntoConstraints = false
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

    /// Text frame size
    private var textFrameSize: CGSize = .zero

    var gesture: CharcoalGesture?

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
        textFrameSize = text.calculateFrame(font: label.font, maxWidth: preferredTextMaxWidth)
        setupLayer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCapsuleShape() {
        addSubview(capsuleShape)
        layer.backgroundColor = CharcoalAsset.ColorPaletteGenerated.background1.color.cgColor
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
        let leftPaddingView = UIView()
        let rightPaddingView = UIView()
        leftPaddingView.widthAnchor.constraint(equalToConstant: padding.left).isActive = true
        rightPaddingView.widthAnchor.constraint(equalToConstant: padding.right).isActive = true
        // Setup Label
        hStackView.addArrangedSubview(leftPaddingView)
        hStackView.addArrangedSubview(label)
        hStackView.addArrangedSubview(rightPaddingView)
        label.text = text
    }

    private func addActionButton() {
        if let _ = action {
            actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
            hStackView.addArrangedSubview(actionButton)
            actionButton.widthAnchor.constraint(equalToConstant: actionButton.intrinsicContentSize.width).isActive = true
            let rightPaddingView = UIView()
            rightPaddingView.widthAnchor.constraint(equalToConstant: padding.right).isActive = true
            hStackView.addArrangedSubview(rightPaddingView)
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

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        textFrameSize = text.calculateFrame(font: label.font, maxWidth: preferredTextMaxWidth)
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

    var preferredLayoutWidth: CGFloat {
        if let _ = thumbnailImage {
            return 64 + padding.left + textFrameSize.width + padding.right
        } else {
            return padding.left + textFrameSize.width + padding.right
        }
    }

    var preferredLayoutHeight: CGFloat {
        if let _ = thumbnailImage {
            return 64
        } else if let _ = action {
            return max(padding.top + label.font.lineHeight + padding.bottom, padding.top + actionButton.intrinsicContentSize.height + padding.bottom)
        } else {
            return padding.top + label.font.lineHeight + padding.bottom
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: preferredLayoutWidth, height: preferredLayoutHeight)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        capsuleShape.frame = bounds
        layer.cornerRadius = min(cornerRadius, bounds.height / 2.0)
    }

    /// Add gesture to this view
    func addGesture(_ gesture: CharcoalGesture) {
        self.gesture = gesture
        addGestureRecognizer(gesture.gesture)
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
