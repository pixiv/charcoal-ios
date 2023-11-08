import UIKit

// NOTE: - ここにCharcoalTextFieldView特有の処理を追加する
public protocol CharcoalTextFieldViewDelegate: UITextFieldDelegate {}

public class CharcoalTextFieldView: UIStackView {
    public var lengthLimit: Int = 0 {
        didSet {
            charcoalTextField.lengthLimit = lengthLimit
        }
    }
    public var title: String? {
        didSet {
            setupTitleLabel()
        }
    }
    public var placeholder: String? {
        didSet {
            charcoalTextField.placeholder = placeholder
        }
    }
    public var assertiveText: String?
    
    public lazy var charcoalTextField: CharcoalTextField = {
        let textField = CharcoalTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return textField
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(charcoalFoundation.typography.size.the14.fontSize))
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text1.color
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return label
    }()
    
    private lazy var assertiveTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(charcoalFoundation.typography.size.the14.fontSize))
        label.textColor = CharcoalAsset.ColorPaletteGenerated.text2.color
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        return label
    }()
    
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
        titleLabel.text = title
        titleLabel.isHidden = title == nil
    }
    
    private func setupCharcoalTextField() {
        charcoalTextField.placeholder = placeholder
    }
    
    private func setupAssertiveTextLabel() {
        assertiveTextLabel.isHidden = true
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

@available(iOS 17.0, *)
#Preview {
    let textField = CharcoalTextFieldView()
    textField.title = "Title"
    textField.placeholder = "Hello World"
    textField.showAssertiveText(text: "This is assertive Text")
    textField.lengthLimit = 10
    return textField
}
