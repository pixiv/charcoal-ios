import SwiftUI

struct CharcoalDefaultOverlayButtonStyleView: View {
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
            .foregroundStyle(charcoalColor: .text2)
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

struct CharcoalDefaultOverlayButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalDefaultOverlayButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed
        )
    }
}

// swiftlint:disable type_name
struct CharcoalDefaultOverlayButtonStyleModifier: ViewModifier {
    let size: CharcoalButtonSize
    let isFixed: Bool

    func body(content: Content) -> some View {
        content.buttonStyle(CharcoalDefaultOverlayButtonStyle(size: size, isFixed: isFixed))
    }
}

public extension View {
    /// Set the style of the button to Charcoal's default overlay button style
    ///
    /// - Parameters:
    ///   - size: The size of the button
    ///   - isFixed: Whether the button should have a fixed width
    @available(*, deprecated, message: "Use buttonStyle(_:) with CharcoalButtonStyle instead.")
    func charcoalDefaultOverlayButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return buttonStyle(.charcoalDefaultOverlay(.init(size: size, isFixed: isFixed)))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Default Overlay Button M") {}
            .buttonStyle(.charcoalDefaultOverlay(.init(size: .medium, isFixed: true)))
        Button("Default Overlay Button M") {}
            .buttonStyle(.charcoalDefaultOverlay(.init(size: .medium, isFixed: true)))
            .disabled(true)
        Button("Default Overlay Button S") {}
            .buttonStyle(.charcoalDefaultOverlay(.init(size: .small, isFixed: true)))
        Button("Default Overlay Button S") {}
            .buttonStyle(.charcoalDefaultOverlay(.init(size: .small, isFixed: true)))
            .disabled(true)
    }
}
