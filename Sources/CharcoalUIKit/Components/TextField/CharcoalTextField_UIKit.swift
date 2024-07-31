import UIKit

public class CharcoalTextField: UITextField {
    public var lengthLimit: Int = 0 {
        didSet {
            setupCountLabelIfNeeded()
        }
    }

    private var exceedLengthLimit = false
    private let borderIdentifireBrand = "net.pixiv.color.brand"
    private let borderIdentifireAssertive = "net.pixiv.color.assertive"
    let countLabel = UILabel()

    private var borderLayer: CALayer?

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        let right = lengthLimit > 0 ? 16 + countLabel.bounds.width : 8
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 8, bottom: 10, right: right))
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let right = lengthLimit > 0 ? 16 + countLabel.bounds.width : 8
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 8, bottom: 10, right: right))
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        let right = lengthLimit > 0 ? 16 + countLabel.bounds.width : 8
        return bounds.inset(by: UIEdgeInsets(top: 10, left: 8, bottom: 10, right: right))
    }

    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        guard lengthLimit > 0 else {
            return CGRect()
        }

        countLabel.sizeToFit()

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

    private func setupStyle() {
        backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface3.color
        borderStyle = .none
        rightViewMode = .always

        layer.masksToBounds = false
        layer.cornerRadius = 4.0

        let scaledFont = UIFont.systemFont(ofSize: CGFloat(CharcoalTypography.textFontSize5)).scaledFont

        defaultTextAttributes = [
            .font: scaledFont,
            .foregroundColor: CharcoalAsset.ColorPaletteGenerated.text2.color
        ]

        let placeholderAttributedString: [NSAttributedString.Key: Any] = [
            .font: scaledFont,
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
        guard lengthLimit > 0 && rightView == nil else {
            rightView = nil
            return
        }

        countLabel.font = UIFont.monospacedSystemFont(ofSize: CGFloat(CharcoalTypography.textFontSize5), weight: .regular).scaledFont
        countLabel.adjustsFontForContentSizeCategory = true
        countLabel.textColor = CharcoalAsset.ColorPaletteGenerated.text3.color
        countLabel.textAlignment = .left
        countLabel.contentMode = .center
        countLabel.numberOfLines = 1

        rightView = countLabel
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        adjustBorderLayerFrame()
    }

    private func updateStyle() {
        alpha = isEnabled ? 1.0 : 0.32
    }

    private func updateBorderColor(borderColor: UIColor, layerName: String) {
        if borderLayer == nil {
            borderLayer = CALayer()
        }
        borderLayer?.frame = CGRect(x: -4, y: -4, width: bounds.width + 8, height: bounds.height + 8)
        borderLayer?.borderColor = borderColor.withAlphaComponent(0.32).cgColor
        borderLayer?.borderWidth = 4.0
        borderLayer?.cornerRadius = 8.0
        borderLayer?.name = layerName

        removeAllBorders()

        if let borderLayer = borderLayer {
            layer.addSublayer(borderLayer)
        }
    }

    private func removeAllBorders() {
        borderLayer?.removeFromSuperlayer()
    }

    private func adjustBorderLayerFrame() {
        borderLayer?.frame = CGRect(x: -4, y: -4, width: bounds.width + 8, height: bounds.height + 8)
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

    override public func resignFirstResponder() -> Bool {
        removeAllBorders()
        return super.resignFirstResponder()
    }
}
