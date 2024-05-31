import UIKit

public class CharcoalHintView: UIView {
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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text1.color
        return label
    }()

    lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    lazy var actionButton: CharcoalPrimarySButton = {
        let button = CharcoalPrimarySButton()
        return button
    }()

    let thumbnailImage: UIImage?

    var action: CharcoalAction?

    let text: String

    /// The corner radius of the snackbar
    let cornerRadius: CGFloat = 8

    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

    var gesture: CharcoalGesture?

    public init(text: String, iconImage: UIImage? = CharcoalAsset.Images.info16.image, action: CharcoalAction? = nil) {
        self.action = action
        self.thumbnailImage = iconImage
        self.text = text
        super.init(frame: .zero)
        self.hStackView.spacing = 5
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
        layer.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface3.color.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.cornerCurve = .continuous
    }

    private func addThumbnailView() {
        if let thumbnailImage = thumbnailImage {
            thumbnailImageView.image = thumbnailImage
            hStackView.addArrangedSubview(thumbnailImageView)
            NSLayoutConstraint.activate([
                thumbnailImageView.widthAnchor.constraint(equalToConstant: 16),
                thumbnailImageView.heightAnchor.constraint(equalToConstant: 16)
            ])
        }
    }

    private func addTextLabel() {
        hStackView.addArrangedSubview(label)
        label.text = text
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }

    private func addActionButton() {
        if let _ = action {
            actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
            hStackView.addArrangedSubview(actionButton)
            actionButton.widthAnchor.constraint(equalToConstant: actionButton.intrinsicContentSize.width).isActive = true
        }
    }

    private func setupLayer() {
        // Setup Bubble Shape
        setupCapsuleShape()

        // Add HStack
        addSubview(hStackView)
        NSLayoutConstraint.activate([
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left),
            hStackView.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
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
    
    stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true

    let snackbar = CharcoalHintView(text: "Hello World")
    stackView.addArrangedSubview(snackbar)
    
    let snackbar2 = CharcoalHintView(text: "ブックマークしました", iconImage: CharcoalAsset.Images.info16.image)
    stackView.addArrangedSubview(snackbar2)
    snackbar2.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true

    let snackbar3 = CharcoalHintView(text: "ブックマークしました", action: CharcoalAction(title: "編集", actionCallback: {
        print("編集 taped")
    }))
    stackView.addArrangedSubview(snackbar3)

    let snackbar4 = CharcoalHintView(
        text: "こんにちは",
        iconImage: CharcoalAsset.Images.info16.image,
        action: CharcoalAction(title: "編集", actionCallback: {
            print("編集 taped")
        })
    )
    stackView.addArrangedSubview(snackbar4)
    snackbar4.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    
    return stackView
}
