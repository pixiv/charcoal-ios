import UIKit

public class CharcoalTypography12: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalTypography.textFontSize1.value)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalTypography.textLineHeight1.value)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography12()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
