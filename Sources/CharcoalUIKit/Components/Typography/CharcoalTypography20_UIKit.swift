import UIKit

public class CharcoalTypography20: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textFontSize30.value)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalFoundation.Typography.textLineHeight30.value)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography20()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
