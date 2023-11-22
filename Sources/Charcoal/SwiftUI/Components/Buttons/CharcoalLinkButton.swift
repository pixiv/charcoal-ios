import SwiftUI

struct CharcoalLinkButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    
    @Environment(\.sizeCategory) var sizeCategory

    var body: some View {
        label
            .font(.system(size: CharcoalButtonSize.small.fontSize, weight: .bold))
            // swiftlint:disable line_length
            .padding(EdgeInsets(top: 11.5, leading: 0, bottom: 11.5, trailing: 0))
            .foregroundStyle(charcoalColor: isPressed ? .text3 : .text1)
            .opacity(isEnabled ? 1.0 : 0.32)
    }
}

@available(iOS 15, *)
struct CharcoalLinkButtonStyleIos15: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalLinkButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled
        )
    }
}

struct CharcoalLinkButtonStyle: ButtonStyle {
    let isEnabled: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalLinkButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled
        )
    }
}

struct CharcoalLinkButtonStyleModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.buttonStyle(CharcoalLinkButtonStyleIos15())
        } else {
            content.buttonStyle(CharcoalLinkButtonStyle(isEnabled: isEnabled))
        }
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalLinkButton() -> some View {
        return modifier(CharcoalLinkButtonStyleModifier())
    }
}
