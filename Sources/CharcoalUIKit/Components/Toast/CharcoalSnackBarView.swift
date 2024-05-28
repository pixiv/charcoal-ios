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
    
    lazy var label: CharcoalTypography14 = {
        let label = CharcoalTypography14()
        label.numberOfLines = 1
        label.isBold = true
        label.textAlignment = .center
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
    
    var thumbnailImage: UIImage?

    let text: String

    lazy var capsuleShape: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.layer.cornerCurve = .continuous
        return view
    }()

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 32

    let borderColor: ColorAsset.Color

    let borderLineWidth: CGFloat = 1

    /// The max width of the tooltip
    let maxWidth: CGFloat

    /// Padding around the bubble
    let padding = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

    /// Text frame size
    private var textFrameSize: CGSize = .zero

    init(text: String, thumbnailImage: UIImage? = nil, maxWidth: CGFloat = 312) {
        self.thumbnailImage = thumbnailImage
        self.maxWidth = maxWidth
        self.text = text
        borderColor = CharcoalAsset.ColorPaletteGenerated.border.color
        super.init(frame: .zero)
        textFrameSize = text.calculateFrame(font: label.font, maxWidth: preferredTextMaxWidth)
        setupLayer()
    }

    func updateTargetPoint(point: CGPoint) {
        setNeedsLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayer() {
        // Setup Bubble Shape
        addSubview(capsuleShape)
        layer.backgroundColor = CharcoalAsset.ColorPaletteGenerated.background1.color.cgColor
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
        
        if let thumbnailImage = thumbnailImage {
            thumbnailImageView.image = thumbnailImage
            hStackView.addArrangedSubview(thumbnailImageView)
            NSLayoutConstraint.activate([
                thumbnailImageView.widthAnchor.constraint(equalToConstant: 64),
                thumbnailImageView.heightAnchor.constraint(equalToConstant: 64)
            ])
        }
        
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

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        textFrameSize = text.calculateFrame(font: label.font, maxWidth: preferredTextMaxWidth)
    }
    
    var preferredTextMaxWidth: CGFloat {
        if let _ = thumbnailImage {
            return maxWidth - padding.left - padding.right - 64
        } else {
            return maxWidth - padding.left - padding.right
        }
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
        } else {
            return padding.top + textFrameSize.height + padding.bottom
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: preferredLayoutWidth, height: preferredLayoutHeight)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        capsuleShape.frame = bounds
        layer.cornerRadius = min(cornerRadius, bounds.height / 2.0)
        label.frame = CGRect(x: padding.left, y: padding.top, width: textFrameSize.width, height: textFrameSize.height)
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let tooltip = CharcoalSnackBarView(text: "Hello World")

    let tooltip2 = CharcoalSnackBarView(text: "ブックマークしました", thumbnailImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64))

    let tooltip3 = CharcoalSnackBarView(text: "here is testing it's multiple line feature")

    let tooltip4 = CharcoalSnackBarView(text: "こんにちは This is a tooltip and here is testing it's multiple line feature")

    stackView.addArrangedSubview(tooltip)
    stackView.addArrangedSubview(tooltip2)
    stackView.addArrangedSubview(tooltip3)
    stackView.addArrangedSubview(tooltip4)

    return stackView
}
