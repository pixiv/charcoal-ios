import UIKit

// NOTE: - ここにCharcoalTextFieldView特有の処理を追加する
public protocol CharcoalTextFieldViewDelegate: UITextFieldDelegate {}

@IBDesignable
public class CharcoalTextFieldView: UIStackView {
    @IBInspectable
    public var lengthLimit: Int = 0
    @IBInspectable
    public var title: String?
    @IBInspectable
    public var placeholder: String?
    @IBInspectable
    public var assertiveText: String?

    public var charcoalTextField = CharcoalTextField()
    private var titleLabel = UILabel()
    private var assertiveTextLabel = UILabel()

    public weak var delegate: CharcoalTextFieldViewDelegate? {
        didSet {
            charcoalTextField.delegate = delegate
        }
    }

    override public var isUserInteractionEnabled: Bool {
        didSet {
            updateStyle()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupStyle()
    }

    private func setupStyle() {
        setupTitleLabel()
        setupCharcoalTextField()
        setupAssertiveTextLabel()
        setupStackView()

        updateStyle()
    }

    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.isHidden = title == nil
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(charcoalFoundation.typography.size.the14.fontSize))
        titleLabel.textColor = CharcoalAsset.ColorPaletteGenerated.text1.color
        titleLabel.numberOfLines = 1
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setupCharcoalTextField() {
        charcoalTextField = CharcoalTextField(lengthLimit: lengthLimit)
        charcoalTextField.placeholder = placeholder
        charcoalTextField.translatesAutoresizingMaskIntoConstraints = false
        charcoalTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupAssertiveTextLabel() {
        assertiveTextLabel = UILabel()
        assertiveTextLabel.isHidden = true
        assertiveTextLabel.font = UIFont.systemFont(ofSize: CGFloat(charcoalFoundation.typography.size.the14.fontSize))
        assertiveTextLabel.textColor = CharcoalAsset.ColorPaletteGenerated.text2.color
        assertiveTextLabel.numberOfLines = 0
        assertiveTextLabel.translatesAutoresizingMaskIntoConstraints = false
        assertiveTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
    }

    private func setupStackView() {
        backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface1.color
        distribution = .fill
        alignment = .fill
        axis = .vertical
        spacing = 8.0

        addArrangedSubview(titleLabel)
        addArrangedSubview(charcoalTextField)
        addArrangedSubview(assertiveTextLabel)
    }

    private func updateStyle() {
        alpha = isUserInteractionEnabled ? 1.0 : 0.32
    }

    open func showAssertiveText(text: String) {
        assertiveTextLabel.text = text
        assertiveTextLabel.isHidden = false
    }

    open func hideAssertiveText() {
        assertiveTextLabel.isHidden = true
    }

    open func updateCountLabel(text: String, hasError: Bool) {
        charcoalTextField.countLabel.text = text
        // swiftlint:disable line_length
        charcoalTextField.countLabel.textColor = hasError ? CharcoalAsset.ColorPaletteGenerated.assertive.color : CharcoalAsset.ColorPaletteGenerated.text3.color
        charcoalTextField.countLabel.sizeToFit()
    }

    open func setHasError(_ hasError: Bool) {
        if hasError {
            charcoalTextField.setAssertiveBorder()
            assertiveTextLabel.textColor = CharcoalAsset.ColorPaletteGenerated.assertive.color
        } else {
            charcoalTextField.setBrandBorder()
            assertiveTextLabel.textColor = CharcoalAsset.ColorPaletteGenerated.text2.color
        }
    }
}
