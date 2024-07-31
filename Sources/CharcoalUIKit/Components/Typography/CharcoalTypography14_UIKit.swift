import UIKit

public class CharcoalTypography14: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalTypography.textFontSize5)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalTypography.textLineHeight5)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography14()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
