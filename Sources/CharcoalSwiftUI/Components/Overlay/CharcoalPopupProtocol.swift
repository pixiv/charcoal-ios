import SwiftUI

typealias CharcoalPopupProtocol = Equatable & Identifiable & View

public enum CharcoalPopupViewEdge {
    case top
    case bottom

    var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        }
    }

    var offset: CGFloat {
        switch self {
        case .top:
            return 1
        case .bottom:
            return -1
        }
    }
}
