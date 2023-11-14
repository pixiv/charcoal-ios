import UIKit

public class CharcoalTypography16: CharcoalTypographyLabel {
    public override var fontSize: CGFloat {
        get {
            return CGFloat(charcoalFoundation.typography.size.the16.fontSize)
        }
    }
    
    public override var lineHeight: CGFloat {
        get {
            return CGFloat(charcoalFoundation.typography.size.the16.lineHeight)
        }
    }
}


@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography16()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
