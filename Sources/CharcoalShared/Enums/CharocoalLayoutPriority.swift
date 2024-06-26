import Foundation

public enum CharcoalTooltipLayoutPriority: Codable {
    case bottom
    case top
    case right
    case left
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
