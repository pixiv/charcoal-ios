import UIKit

public class CharcoalTypography20: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(CharcoalTypography.textFontSize30)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(CharcoalTypography.textLineHeight30)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography20()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
