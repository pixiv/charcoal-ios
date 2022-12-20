import UIKit

@IBDesignable
public class CharcoalTypography12: UILabel {
    @IBInspectable
    var isBold: Bool = false
    @IBInspectable
    var isMono: Bool = false

    private let fontSize = CGFloat(charcoalFoundation.typography.size.the12.fontSize)
    private let lineHeight = CGFloat(charcoalFoundation.typography.size.the12.lineHeight)

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

    private func setupStyle() {
        setupFont(fontSize: fontSize, isBold: isBold, isMono: isMono)
        if isMono {
            numberOfLines = 1
        } else {
            setupLineHeight(lineHeight: lineHeight)
        }
    }
}
