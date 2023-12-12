import UIKit

public class CharcoalTypography16: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the16.fontSize)
    }

    override public var lineHeight: CGFloat {
        return CGFloat(charcoalFoundation.typography.size.the16.lineHeight)
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography16()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
