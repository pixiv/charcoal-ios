import UIKit

public class CharcoalTypography14: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the14.fontSize)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the14.lineHeight)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography14()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
