import UIKit

public class CharcoalTextField: UITextField {
    private var lengthLimit: Int = 0
    private var exceedLengthLimit = false
    private let borderIdentifireBrand = "net.pixiv.color.brand"
    private let borderIdentifireAssertive = "net.pixiv.color.assertive"
    let countLabel = UILabel()

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        let right = lengthLimit > 0 ? 16 + countLabel.bounds.width : 8
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: right))
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let right = lengthLimit > 0 ? 16 + countLabel.bounds.width : 8
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: right))
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        let right = lengthLimit > 0 ? 16 + countLabel.bounds.width : 8
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: right))
    }

    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        guard lengthLimit > 0 else {
            return CGRect()
        }

        return CGRect(
            x: bounds.width - 8 - countLabel.bounds.width,
            y: 0,
            width: countLabel.frame.width,
            height: bounds.height
        )
    }

    override public var isEnabled: Bool {
        didSet {
            updateStyle()
        }
    }

    init(lengthLimit: Int) {
        super.init(frame: CGRect())
        self.lengthLimit = lengthLimit
        setupStyle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
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
        backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface3.color
        borderStyle = .none
        rightViewMode = .always

        layer.masksToBounds = false
        layer.cornerRadius = 4.0

        defaultTextAttributes = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: CharcoalAsset.ColorPaletteGenerated.text2.color
        ]

        let placeholderAttributedString: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: CharcoalAsset.ColorPaletteGenerated.text3.color
        ]

        if let placeholder = placeholder {
            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: placeholderAttributedString
            )
        }

        setupCountLabelIfNeeded()
        updateStyle()
    }

    private func setupCountLabelIfNeeded() {
        guard lengthLimit > 0 else {
            return
        }

        countLabel.font = UIFont.monospacedSystemFont(ofSize: 14, weight: .regular)

        countLabel.textColor = CharcoalAsset.ColorPaletteGenerated.text3.color
        countLabel.textAlignment = .left
        countLabel.contentMode = .center

        rightView = countLabel
    }

    private func updateStyle() {
        alpha = isEnabled ? 1.0 : 0.32
    }

    private func updateBorderColor(borderColor: UIColor, layerName: String) {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: -4, y: -4, width: bounds.width + 8, height: bounds.height + 8)
        borderLayer.borderColor = borderColor.withAlphaComponent(0.32).cgColor
        borderLayer.borderWidth = 4.0
        borderLayer.cornerRadius = 8.0
        borderLayer.name = layerName
        
        removeAllBorder()

        layer.addSublayer(borderLayer)
    }
    
    private func removeAllBorder() {
        layer.sublayers?.forEach {
            if $0.name == borderIdentifireBrand || $0.name == borderIdentifireAssertive {
                $0.removeFromSuperlayer()
            }
        }
    }

    public func setAssertiveBorder() {
        updateBorderColor(
            borderColor: CharcoalAsset.ColorPaletteGenerated.assertive.color,
            layerName: borderIdentifireAssertive
        )
    }

    public func setBrandBorder() {
        updateBorderColor(
            borderColor: CharcoalAsset.ColorPaletteGenerated.brand.color,
            layerName: borderIdentifireBrand
        )
    }
    
    public override func resignFirstResponder() -> Bool {
        removeAllBorder()
        return super.resignFirstResponder()
    }
}
