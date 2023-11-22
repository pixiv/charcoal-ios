import SwiftUI

extension CharcoalButtonSize {
    var padding: EdgeInsets {
        switch self {
        case .medium:
            return EdgeInsets(top: 11, leading: 24, bottom: 11, trailing: 24)
        case .small:
            return EdgeInsets(top: 7, leading: 16, bottom: 7, trailing: 16)
        }
    }
    
    var cornerRadius: CGFloat {
        return UIFontMetrics(forTextStyle: .body).scaledValue(for: padding.leading)
    }
}
