import SwiftUI

typealias CharcoalToastProtocol = CharcoalToastActionProtocol & CharcoalToastBaseProtocol

typealias CharcoalAnimatedToastProtocol = CharcoalToastAnimationProtocol & CharcoalToastProtocol

protocol CharcoalToastBaseProtocol {
    /// The text of the toast
    var text: String { get }
    /// The maximum width of the toast
    var maxWidth: CGFloat { get }
    /// The toast will be dismissed after a certain time interval.
    var dismissAfter: TimeInterval? { get }
    /// The edge of the screen where the toast will be presented
    var screenEdge: CharcoalPopupViewEdge { get }
    /// The spacing between the toast and the screen edge
    var screenEdgeSpacing: CGFloat { get }
    /// If the toast is currently being presented
    var isPresenting: Bool { get set }
    /// Radius of the toast corners
    var cornerRadius: CGFloat { get }
    /// Color of the toast border
    var borderColor: Color { get }
    /// Width of the toast border line
    var borderLineWidth: CGFloat { get }
}

protocol CharcoalToastActionProtocol {
    associatedtype ActionContent: View
    /// The content of the action view
    var action: ActionContent? { get }
}

protocol CharcoalToastAnimationProtocol {
    /// The configuration of the toast animation
    var animationConfiguration: CharcoalToastAnimationConfiguration { get }
}
