import SwiftUI

public protocol CharcoalButtonModifier: ViewModifier {}

public enum CharcoalButtonStyle {
    case primary(Configuration)
    case `default`
    case defaultButton(Configuration)
    case defaultOverlay(Configuration)
    case navigation(Configuration)
    case link

    @ViewBuilder
    func apply<Content: View>(_ content: Content) -> some View {
        switch self {
        case let .primary(configuration):
            content.buttonStyle(CharcoalPrimaryButtonStyle(size: configuration.size, isFixed: configuration.isFixed, primaryColor: configuration.primaryColor))
        case .default:
            content.buttonStyle(CharcoalDefaultButtonStyle(size: .medium, isFixed: true))
        case let .defaultButton(configuration):
            content.buttonStyle(CharcoalDefaultButtonStyle(size: configuration.size, isFixed: configuration.isFixed))
        case let .defaultOverlay(configuration):
            content.buttonStyle(CharcoalDefaultOverlayButtonStyle(size: configuration.size, isFixed: configuration.isFixed))
        case let .navigation(configuration):
            content.buttonStyle(CharcoalNavigationButtonStyle(size: configuration.size, isFixed: configuration.isFixed))
        case .link:
            content.buttonStyle(CharcoalLinkButtonStyle())
        }
    }
}

public extension CharcoalButtonStyle {
    struct Configuration {
        public var size: CharcoalButtonSize
        public var isFixed: Bool
        public var primaryColor: Color

        public init(
            size: CharcoalButtonSize = .medium,
            isFixed: Bool = true,
            primaryColor: Color = Color(charcoalColor: .brand)
        ) {
            self.size = size
            self.isFixed = isFixed
            self.primaryColor = primaryColor
        }
    }
}

extension View {
    @available(*, deprecated, message: "Use buttonStyle(charcoalStyle:) instead.")
    func charcoalButtonStyle(_ style: CharcoalButtonStyle) -> some View {
        style.apply(self)
    }
}

public extension View {
    func buttonStyle(charcoalStyle: CharcoalButtonStyle) -> some View {
        charcoalStyle.apply(self)
    }
}
