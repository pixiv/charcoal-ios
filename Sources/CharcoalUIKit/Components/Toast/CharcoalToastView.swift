import UIKit

class CharcoalToastView: UIView {
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

    /// Text frame size
    private var textFrameSize: CGSize = .zero

    init(text: String, maxWidth: CGFloat = 312, appearance: CharcoalToastAppearance = .success) {
        self.maxWidth = maxWidth
        self.text = text
        self.appearance = appearance
        borderColor = CharcoalAsset.ColorPaletteGenerated.background1.color
        super.init(frame: .zero)
        textFrameSize = text.calculateFrame(font: label.font, maxWidth: maxWidth)
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

    let toast = CharcoalToastView(text: "Hello World")

    let toast2 = CharcoalToastView(text: "Hello World This is a toast", appearance: .error)

    let toast3 = CharcoalToastView(text: "here is testing it's multiple line feature")

    let toast4 = CharcoalToastView(text: "こんにちは This is a toast and here is testing it's multiple line feature")

    stackView.addArrangedSubview(toast)
    stackView.addArrangedSubview(toast2)
    stackView.addArrangedSubview(toast3)
    stackView.addArrangedSubview(toast4)

    return stackView
}
