import Foundation

public enum CharcoalPopupViewEdge {
    case top
    case bottom

    public var direction: CGFloat {
        switch self {
        case .top:
            return 1
        case .bottom:
            return -1
        }
    }
}
