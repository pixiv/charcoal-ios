import UIKit

public class CharcoalTypography12: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textFontSize1.value)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textLineHeight1.value)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography12()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
