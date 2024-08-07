import UIKit

public class CharcoalTypography14: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textFontSize5.value)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textLineHeight5.value)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography14()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
