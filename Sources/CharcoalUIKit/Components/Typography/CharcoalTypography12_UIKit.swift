import UIKit

public class CharcoalTypography12: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalTypography.textFontSize1)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalTypography.textLineHeight1)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography12()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
