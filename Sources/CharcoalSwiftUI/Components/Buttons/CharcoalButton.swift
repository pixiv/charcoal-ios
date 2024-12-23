import SwiftUI

public protocol CharcoalButtonModifier: ViewModifier {}

public enum CharcoalButtonStyle {
    case primary(Configuration)
    case `default`

    @ViewBuilder
    func apply<Content: View>(_ content: Content) -> some View {
        switch self {
        case let .primary(configuration):
            content.charcoalPrimaryButton(size: configuration.size, isFixed: configuration.isFixed, primaryColor: configuration.primaryColor)
        case .default:
            content.charcoalDefaultButton(size: .medium, isFixed: true)
        }
    }
}

extension CharcoalButtonStyle {
    public struct Configuration {
        public var size: CharcoalButtonSize
        public var isFixed = true
        public var primaryColor: Color
        
        public init(size: CharcoalButtonSize = .medium, isFixed: Bool = true, primaryColor: Color) {
            self.size = size
            self.isFixed = isFixed
            self.primaryColor = primaryColor
        }
    }
}

extension View {
    func charcoalButtonStyle(_ style: CharcoalButtonStyle) -> some View {
        style.apply(self)
    }
}
