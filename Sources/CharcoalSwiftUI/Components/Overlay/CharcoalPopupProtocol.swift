import SwiftUI

typealias CharcoalPopupProtocol = Equatable & Identifiable & View

extension CharcoalPopupViewEdge {
    var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        }
    }

    var direction: CGFloat {
        switch self {
        case .top:
            return 1
        case .bottom:
            return -1
        }
    }
}
