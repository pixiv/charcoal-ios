import UIKit

public class CharcoalPrimarySButton: UIButton, CharcoalButton {
    public var isFixed: Bool = false
    public var primaryColor: UIColor = CharcoalAsset.ColorPaletteGenerated.brand.color

    override public var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        let fixedSize = superview?.frame.width ?? contentSize.width
        return CGSize(
            width: isFixed ? fixedSize : contentSize.width,
            height: 32
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

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }

    private func setupStyle() {
        if #available(iOS 15, *) {
            configuration = generateUIButtonConfiguration(
                textColor: CharcoalAsset.ColorPaletteGenerated.text5.color,
                enabledBackgroundColor: primaryColor,
                pressedOverlayColor: CharcoalAsset.ColorPaletteGenerated.surface10.color,
                size: .small
            )
        } else {
            setupButtonStyle(
                textColor: CharcoalAsset.ColorPaletteGenerated.text5.color,
                enabledBackgroundColor: primaryColor,
                pressedOverlayColor: CharcoalAsset.ColorPaletteGenerated.surface10.color,
                size: .small
            )
        }

        updateStyle()
    }

    private func updateStyle() {
        alpha = isEnabled ? 1.0 : 0.32
    }
}

@available(iOS 17.0, *)
#Preview {
    let button = CharcoalPrimarySButton()
    button.setTitle("Home", for: .normal)
    return button
}
