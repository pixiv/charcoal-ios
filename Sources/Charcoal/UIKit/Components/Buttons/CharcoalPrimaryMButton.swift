import UIKit

@IBDesignable
public class CharcoalPrimaryMButton: UIButton, CharcoalButton {
    @IBInspectable
    public var isFixed: Bool = false
    @IBInspectable
    public var color: UIColor = CharcoalAsset.ColorPaletteGenerated.brand.color

    override public var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        let fixedSize = superview?.frame.width ?? contentSize.width
        return CGSize(
            width: isFixed ? fixedSize : contentSize.width,
            height: 40
        )
    }

    override public var isEnabled: Bool {
        didSet {
            updateStyle()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    public required init?(coder aDecoder: NSCoder) {
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

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }

    private func setupStyle() {
        if #available(iOS 15, *) {
            configuration = generateUIButtonConfiguration(
                textColor: CharcoalAsset.ColorPaletteGenerated.text5.color,
                enabledBackgroundColor: color,
                pressedOverlayColor: CharcoalAsset.ColorPaletteGenerated.surface10.color,
                size: .medium
            )
        } else {
            setupButtonStyle(
                textColor: CharcoalAsset.ColorPaletteGenerated.text5.color,
                enabledBackgroundColor: color,
                pressedOverlayColor: CharcoalAsset.ColorPaletteGenerated.surface10.color,
                size: .medium
            )
        }

        updateStyle()
    }

    private func updateStyle() {
        alpha = isEnabled ? 1.0 : 0.32
    }
}
