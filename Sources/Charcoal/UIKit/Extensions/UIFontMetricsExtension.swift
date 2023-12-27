import UIKit

extension UIFontMetrics {
    func charcoalScaledValue(for value: CGFloat) -> CGFloat {
        if let fixSizeCategory = CharcoalConfig.fixedSizeCategory {
            return UIFontMetrics.default.scaledValue(for: value, compatibleWith: UITraitCollection(preferredContentSizeCategory: fixSizeCategory))
        } else {
            return UIFontMetrics.default.scaledValue(for: value)
        }
    }
}
