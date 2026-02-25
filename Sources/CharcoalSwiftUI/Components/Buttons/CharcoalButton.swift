import SwiftUI

public protocol CharcoalButtonModifier: ViewModifier {}

public enum CharcoalButtonStyle: ButtonStyle {
    case primary(CharcoalConfiguration)
    case `default`
    case defaultButton(CharcoalConfiguration)
    case defaultOverlay(CharcoalConfiguration)
    case navigation(CharcoalConfiguration)
    case link

    @ViewBuilder
    public func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        switch self {
        case let .primary(styleConfiguration):
            CharcoalPrimaryButtonStyle(
                size: styleConfiguration.size,
                isFixed: styleConfiguration.isFixed,
                primaryColor: styleConfiguration.primaryColor
            ).makeBody(configuration: configuration)
        case .default:
            CharcoalDefaultButtonStyle(size: .medium, isFixed: true).makeBody(configuration: configuration)
        case let .defaultButton(styleConfiguration):
            CharcoalDefaultButtonStyle(size: styleConfiguration.size, isFixed: styleConfiguration.isFixed).makeBody(configuration: configuration)
        case let .defaultOverlay(styleConfiguration):
            CharcoalDefaultOverlayButtonStyle(size: styleConfiguration.size, isFixed: styleConfiguration.isFixed).makeBody(configuration: configuration)
        case let .navigation(styleConfiguration):
            CharcoalNavigationButtonStyle(size: styleConfiguration.size, isFixed: styleConfiguration.isFixed).makeBody(configuration: configuration)
        case .link:
            CharcoalLinkButtonStyle().makeBody(configuration: configuration)
        }
    }
}

public extension CharcoalButtonStyle {
    struct CharcoalConfiguration {
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

    @available(*, deprecated, renamed: "CharcoalButtonStyle.CharcoalConfiguration")
    typealias Configuration = CharcoalConfiguration
}

public extension ButtonStyle where Self == CharcoalButtonStyle {
    static func charcoalPrimary(_ configuration: CharcoalButtonStyle.CharcoalConfiguration = .init()) -> Self {
        .primary(configuration)
    }

    static func charcoalDefault(_ configuration: CharcoalButtonStyle.CharcoalConfiguration = .init()) -> Self {
        .defaultButton(configuration)
    }

    @available(*, deprecated, message: "Use charcoalDefault(_:) instead.")
    static func charcoalDefaultButton(_ configuration: CharcoalButtonStyle.CharcoalConfiguration = .init()) -> Self {
        .charcoalDefault(configuration)
    }

    static func charcoalDefaultOverlay(_ configuration: CharcoalButtonStyle.CharcoalConfiguration = .init()) -> Self {
        .defaultOverlay(configuration)
    }

    static func charcoalNavigation(_ configuration: CharcoalButtonStyle.CharcoalConfiguration = .init()) -> Self {
        .navigation(configuration)
    }

    static var charcoalLink: Self {
        .link
    }
}

extension View {
    @available(*, deprecated, message: "Use buttonStyle(_:) with CharcoalButtonStyle instead.")
    func charcoalButtonStyle(_ style: CharcoalButtonStyle) -> some View {
        buttonStyle(style)
    }
}

public extension View {
    @available(*, deprecated, message: "Use buttonStyle(_:) with CharcoalButtonStyle instead.")
    func buttonStyle(charcoalStyle: CharcoalButtonStyle) -> some View {
        buttonStyle(charcoalStyle)
    }
}
