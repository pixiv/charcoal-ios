import SwiftUI

public enum CharcoalModalStyle {
    case center
    case bottomSheet
    case fullScreen

    var modalScale: CGSize {
        switch self {
        case .center:
            return CGSize(width: 1.05, height: 1.05)
        case .bottomSheet, .fullScreen:
            return CGSize(width: 1.0, height: 1.0)
        }
    }

    /// Modal content alignment
    var alignment: Alignment {
        switch self {
        case .center:
            return .center
        case .bottomSheet:
            return .bottom
        case .fullScreen:
            return .top
        }
    }

    /// Modal content padding around the edges
    var padding: CGFloat {
        switch self {
        case .center:
            return 24
        case .bottomSheet, .fullScreen:
            return 0
        }
    }

    var roundedCorners: UIRectCorner {
        switch self {
        case .center:
            return [.allCorners]
        case .bottomSheet:
            return [.topLeft, .topRight]
        case .fullScreen:
            return []
        }
    }
}
