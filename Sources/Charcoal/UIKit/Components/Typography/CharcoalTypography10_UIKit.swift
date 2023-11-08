import UIKit

public class CharcoalTypography10: UILabel {
    var isBold: Bool = false
    var isMono: Bool = false

    private let fontSize: CGFloat = 10
    private let lineHeight: CGFloat = 18

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

    private func setupStyle() {
        setupFont(fontSize: fontSize, isBold: isBold, isMono: isMono)
        if isMono {
            numberOfLines = 1
        } else {
            setupLineHeight(lineHeight: lineHeight)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography10()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
