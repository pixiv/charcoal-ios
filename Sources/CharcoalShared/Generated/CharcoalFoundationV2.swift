import Foundation

public struct CharcoalFoundationV2: Codable {
    public let radius: [String: Double]
    public let spacing: [String: Double]
    public let typography: [String: String]

    public init(radius: [String: Double], spacing: [String: Double], typography: [String: String]) {
        self.radius = radius
        self.spacing = spacing
        self.typography = typography
    }
}
