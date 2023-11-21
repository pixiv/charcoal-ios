import UIKit

public class CharcoalTypography20: CharcoalTypographyLabel {
    public override var fontSize: CGFloat {
        get {
            return CGFloat(charcoalFoundation.typography.size.the20.fontSize)
        }
    }
    
    public override var lineHeight: CGFloat {
        get {
            return CGFloat(charcoalFoundation.typography.size.the20.lineHeight)
        }
    }
}


@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography20()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
