import UIKit

public class CharcoalTypography10: CharcoalTypographyLabel {
    override public var fontSize: CGFloat {
        return 10
    }

    override public var lineHeight: CGFloat {
        return 18
    }
}

@available(iOS 17.0, *)
#Preview {
    let typography = CharcoalTypography10()
    typography.text = "Heavy boxes perform quick waltzes and jigs"
    return typography
}
