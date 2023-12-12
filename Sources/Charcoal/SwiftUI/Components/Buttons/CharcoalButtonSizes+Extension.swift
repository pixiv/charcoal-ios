import SwiftUI

extension CharcoalButtonSize {
    var padding: EdgeInsets {
        switch self {
        case .medium:
            return EdgeInsets(top: 11.5, leading: 24, bottom: 11.5, trailing: 24)
        case .small:
            return EdgeInsets(top: 7.5, leading: 16, bottom: 7.5, trailing: 16)
        }
    }
    
    var cornerRadius: CGFloat {
        return padding.leading
    }
    
    var fontSize: CGFloat {
        return 14
    }
}
