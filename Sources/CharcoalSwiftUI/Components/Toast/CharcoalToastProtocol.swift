import SwiftUI

protocol CharcoalToastProtocol {
    associatedtype ActionContent: View
    /// The text of the toast
    var text: String { get }
    /// The maximum width of the toast
    var maxWidth: CGFloat { get }
    /// The configuration of the toast animation
    var animationConfiguration: CharcoalToastAnimationConfiguration { get }
    /// The toast will be dismissed after a certain time interval.
    var dismissAfter: TimeInterval? { get }
    /// The edge of the screen where the toast will be presented
    var screenEdge: CharcoalPopupViewEdge { get }
    /// The spacing between the toast and the screen edge
    var screenEdgeSpacing: CGFloat { get }
    /// The content of the action view
    var action: ActionContent? { get }
}
