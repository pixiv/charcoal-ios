import Foundation

public enum CharcoalTooltipLayoutPriority: Codable {
    case bottom
    case top
    case right
    case left

    public var order: Int {
        switch self {
        case .bottom:
            return 0
        case .top:
            return 1
        case .right:
            return 2
        case .left:
            return 3
        }
    }
}

public struct LayoutPriority {
    public var priority: CharcoalTooltipLayoutPriority
    public var spaceArea: CGSize

    public var rect: CGRect {
        return CGRect(x: 0, y: 0, width: spaceArea.width, height: spaceArea.height)
    }

    public init(priority: CharcoalTooltipLayoutPriority, spaceArea: CGSize) {
        self.priority = priority
        self.spaceArea = spaceArea
    }
}
