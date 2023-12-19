import UIKit

extension UIFont {
    var scaledFont: UIFont {
        return UIFontMetrics.default.scaledFont(for: self)
    }
}
