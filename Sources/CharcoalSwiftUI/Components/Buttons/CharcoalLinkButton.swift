import SwiftUI

struct CharcoalLinkButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool

    var body: some View {
        label
            .font(.system(size: 14, weight: .bold))
            // swiftlint:disable line_length
            .backport.foregroundStyle(Color(isPressed ? CharcoalAsset.ColorPaletteGenerated.text3.color : CharcoalAsset.ColorPaletteGenerated.text1.color))
            .frame(height: 40)
            .opacity(isEnabled ? 1.0 : 0.32)
    }
}

@available(iOS 15, macOS 12, *)
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
        if #available(iOS 15, macOS 12, *) {
            content.buttonStyle(CharcoalLinkButtonStyleIos15())
        } else {
            content.buttonStyle(CharcoalLinkButtonStyle(isEnabled: isEnabled))
        }
    }
}

public extension View {
    func charcoalLinkButton() -> some View {
        return modifier(CharcoalLinkButtonStyleModifier())
    }
}
