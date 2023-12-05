import SwiftUI

public enum CharcoalModalStyle {
    case center
    case bottom
    
    var modalScale: CGSize {
        switch self {
        case .center:
            return CGSize(width: 1.05, height: 1.05)
        case .bottom:
            return CGSize(width: 1.0, height: 1.0)
        }
    }
}
