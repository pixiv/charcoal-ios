import UIKit

public class CharcoalTypography10: CharcoalTypographyLabel {
    public override var fontSize: CGFloat {
        get {
            return 10
        }
    }
    
    public override var lineHeight: CGFloat {
        get {
            return 18
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography10()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
