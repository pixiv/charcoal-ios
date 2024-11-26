import SwiftUI

public protocol CharcoalButtonModifier: ViewModifier {}

public enum CharcoalButtonStyle {
    case primary(Color)
    case `default`

    @ViewBuilder
    func apply<Content: View>(_ content: Content) -> some View {
        switch self {
        case let .primary(primaryColor):
            content.charcoalPrimaryButton(size: .medium, isFixed: true, primaryColor: primaryColor)
        case .default:
            content.charcoalDefaultButton(size: .medium, isFixed: true)
        }
    }
}

extension View {
    func charcoalButtonStyle(_ style: CharcoalButtonStyle) -> some View {
        style.apply(self)
    }
}
