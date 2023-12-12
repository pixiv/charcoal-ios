import UIKit

public class CharcoalTypography12: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the12.fontSize)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the12.lineHeight)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography12()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
