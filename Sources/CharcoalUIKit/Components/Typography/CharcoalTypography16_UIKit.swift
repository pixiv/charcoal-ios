import UIKit

public class CharcoalTypography16: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textFontSize10.value)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textLineHeight10.value)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography16()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
