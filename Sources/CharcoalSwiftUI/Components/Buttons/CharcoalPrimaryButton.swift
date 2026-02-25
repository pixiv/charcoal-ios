import SwiftUI

struct CharcoalPrimaryButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let primaryColor: Color

    @ScaledMetric var fontSize: CGFloat

    init(label: ButtonStyleConfiguration.Label, isPressed: Bool, isEnabled: Bool, size: CharcoalButtonSize, isFixed: Bool, primaryColor: Color) {
        self.label = label
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.size = size
        self.isFixed = isFixed
        self.primaryColor = primaryColor
        _fontSize = ScaledMetric(wrappedValue: size.fontSize)
    }

    var body: some View {
        label
            .font(.system(size: fontSize, weight: .bold))
            .foregroundStyle(charcoalColor: .text5)
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .background(primaryColor)
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .clipShape(.charcoalCapsule)
            .hoverEffect(.lift)
    }
}

struct CharcoalPrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool
    let primaryColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalPrimaryButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed,
            primaryColor: primaryColor
        )
    }
}

public extension View {
    /// Set the style of the button to Charcoal's primary button style.
    ///
    /// - Parameters:
    ///   - size: The size of the button.
    ///   - isFixed: Whether the button should have a fixed width.
    ///   - primaryColor: The primary color of the button.
    @available(*, deprecated, message: "Use buttonStyle(_:) with CharcoalButtonStyle instead.")
    func charcoalPrimaryButton(
        size: CharcoalButtonSize = .medium,
        isFixed: Bool = true,
        primaryColor: Color = Color(CharcoalAsset.ColorPaletteGenerated.brand.color)
    ) -> some View {
        return buttonStyle(.charcoalPrimary(.init(size: size, isFixed: isFixed, primaryColor: primaryColor)))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Primary Button M") {}
            .buttonStyle(.charcoalPrimary(.init(size: .medium, isFixed: true)))
        Button("Primary Button M") {}
            .buttonStyle(.charcoalPrimary(.init(size: .medium, isFixed: true)))
            .disabled(true)
        Button("Primary Button S") {}
            .buttonStyle(.charcoalPrimary(.init(size: .small, isFixed: true)))
        Button("Primary Button S") {}
            .buttonStyle(.charcoalPrimary(.init(size: .small, isFixed: true)))
            .disabled(true)
    }
}
