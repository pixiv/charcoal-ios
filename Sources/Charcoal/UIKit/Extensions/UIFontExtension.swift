import UIKit

extension UIFont {
    var scaledFont: UIFont {
        if let _ = CharcoalConfig.fixedSizeCategory {
            return withSize(UIFontMetrics.default.charcoalScaledValue(for: pointSize))
        } else {
            // Keep scaledFont to makes dynamic type preview works Xcode
            return UIFontMetrics.default.scaledFont(for: self)
        }
    }
}
