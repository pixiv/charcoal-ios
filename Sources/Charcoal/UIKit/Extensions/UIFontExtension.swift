import UIKit

extension UIFont {
    var scaledFont: UIFont {
        if let _ = CharcoalConfig.fixedSizeCategory {
            return self.withSize(UIFontMetrics.default.charcoalScaledValue(for: self.pointSize))
        } else {
            // Keep scaledFont to makes dynamic type preview works Xcode
            return UIFontMetrics.default.scaledFont(for: self)
        }
    }
}
