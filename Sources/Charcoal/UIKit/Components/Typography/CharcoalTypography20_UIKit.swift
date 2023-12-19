import UIKit

public class CharcoalTypography20: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the20.fontSize)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the20.lineHeight)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography20()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
