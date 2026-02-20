import SwiftUI

struct CharcoalDefaultButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool

    @ScaledMetric var fontSize: CGFloat

    init(label: ButtonStyleConfiguration.Label, isPressed: Bool, isEnabled: Bool, size: CharcoalButtonSize, isFixed: Bool) {
        self.label = label
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.size = size
        self.isFixed = isFixed
        _fontSize = ScaledMetric(wrappedValue: size.fontSize)
    }

    var body: some View {
        label
            .font(.system(size: fontSize, weight: .bold))
            .foregroundStyle(Color(charcoalColor: .text2))
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .background(charcoalColor: .surface3)
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .clipShape(.charcoalCapsule)
            .hoverEffect(.lift)
    }
}

struct CharcoalDefaultButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalDefaultButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed
        )
    }
}

struct CharcoalDefaultButtonStyleModifier: ViewModifier {
    let size: CharcoalButtonSize
    let isFixed: Bool

    func body(content: Content) -> some View {
        content.buttonStyle(CharcoalDefaultButtonStyle(size: size, isFixed: isFixed))
    }
}

public extension View {
    /// Set the style of the button to Charcoal's default button style.
    ///
    /// - Parameters:
    ///   - size: The size of the button.
    ///   - isFixed: A Boolean value that indicates whether the button has a fixed width.
    @available(*, deprecated, message: "Use buttonStyle(charcoalStyle:) instead.")
    func charcoalDefaultButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return buttonStyle(charcoalStyle: .defaultButton(.init(size: size, isFixed: isFixed, primaryColor: Color(charcoalColor: .brand))))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Default Button M") {}
            .buttonStyle(charcoalStyle: .defaultButton(.init(size: .medium, isFixed: true, primaryColor: Color(charcoalColor: .brand))))
        Button("Default Button M") {}
            .buttonStyle(charcoalStyle: .defaultButton(.init(size: .medium, isFixed: true, primaryColor: Color(charcoalColor: .brand))))
            .disabled(true)
        Button("Default Button S") {}
            .buttonStyle(charcoalStyle: .defaultButton(.init(size: .small, isFixed: true, primaryColor: Color(charcoalColor: .brand))))
        Button("Default Button S") {}
            .buttonStyle(charcoalStyle: .defaultButton(.init(size: .small, isFixed: true, primaryColor: Color(charcoalColor: .brand))))
            .disabled(true)
    }
}
