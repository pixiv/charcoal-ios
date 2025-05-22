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
            .charcoalOnSurfaceText2()
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .charcoalSurface3()
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .backport.foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .clipShape(.charcoalCapsule)
            .hoverEffect(.lift)
    }
}

@available(iOS 15, *)
struct CharcoalDefaultOverlayButtonStyleIos15: ButtonStyle {
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

struct CharcoalDefaultOverlayButtonStyle: ButtonStyle {
    let isEnabled: Bool
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
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.buttonStyle(CharcoalDefaultOverlayButtonStyleIos15(size: size, isFixed: isFixed))
        } else {
            content.buttonStyle(CharcoalDefaultOverlayButtonStyle(isEnabled: isEnabled, size: size, isFixed: isFixed))
        }
    }
}

public extension View {
    /// Set the style of the button to Charcoal's default overlay button style
    ///
    /// - Parameters:
    ///   - size: The size of the button
    ///   - isFixed: Whether the button should have a fixed width
    func charcoalDefaultOverlayButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalDefaultOverlayButtonStyleModifier(size: size, isFixed: isFixed))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Default Overlay Button M") {}
            .charcoalDefaultOverlayButton(size: .medium)
        Button("Default Overlay Button M") {}
            .charcoalDefaultOverlayButton(size: .medium)
            .disabled(true)
        Button("Default Overlay Button S") {}
            .charcoalDefaultOverlayButton(size: .small)
        Button("Default Overlay Button S") {}
            .charcoalDefaultOverlayButton(size: .small)
            .disabled(true)
    }
}
