import SwiftUI

struct CharcoalLinkButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool

    @ScaledMetric var fontSize: CGFloat = CharcoalButtonSize.small.fontSize

    var body: some View {
        label
            .font(.system(size: fontSize, weight: .bold))
            // swiftlint:disable line_length
            .padding(EdgeInsets(top: 11.5, leading: 16, bottom: 11.5, trailing: 16))
            .foregroundStyle(charcoalColor: isPressed ? .text3 : .text1)
            .opacity(isEnabled ? 1.0 : 0.32)
            .hoverEffect(.highlight)
    }
}

struct CharcoalLinkButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalLinkButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled
        )
    }
}

struct CharcoalLinkButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.buttonStyle(CharcoalLinkButtonStyle())
    }
}

public extension View {
    /// Set the style of the button to Charcoal's link button
    @available(*, deprecated, message: "Use buttonStyle(charcoalStyle:) instead.")
    func charcoalLinkButton() -> some View {
        return buttonStyle(charcoalStyle: .link)
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Link") {}
            .buttonStyle(charcoalStyle: .link)
        Button("Link") {}
            .buttonStyle(charcoalStyle: .link)
            .disabled(true)
    }
}
