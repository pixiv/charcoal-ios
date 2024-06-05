import SwiftUI

struct CharcoalPrimaryButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let primaryColor: Color

    @ScaledMetric var fontSize: CGFloat

    @ScaledMetric var cornerRadius: CGFloat

    init(label: ButtonStyleConfiguration.Label, isPressed: Bool, isEnabled: Bool, size: CharcoalButtonSize, isFixed: Bool, primaryColor: Color) {
        self.label = label
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.size = size
        self.isFixed = isFixed
        self.primaryColor = primaryColor
        _fontSize = ScaledMetric(wrappedValue: size.fontSize)
        _cornerRadius = ScaledMetric(wrappedValue: size.cornerRadius)
    }

    var body: some View {
        label
            .font(.system(size: fontSize, weight: .bold))
            .charcoalOnSurfaceText5()
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .background(primaryColor)
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .backport.foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(cornerRadius)
    }
}

@available(iOS 15, *)
struct CharcoalPrimaryButtonStyleIos15: ButtonStyle {
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

struct CharcoalPrimaryButtonStyle: ButtonStyle {
    let isEnabled: Bool
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

struct CharcoalPrimaryButtonStyleModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool
    let primaryColor: Color

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            // swiftlint:disable line_length
            content.buttonStyle(CharcoalPrimaryButtonStyleIos15(size: size, isFixed: isFixed, primaryColor: primaryColor))
        } else {
            // swiftlint:disable line_length
            content.buttonStyle(CharcoalPrimaryButtonStyle(isEnabled: isEnabled, size: size, isFixed: isFixed, primaryColor: primaryColor))
        }
    }
}

public extension View {
    /// Set the style of the button to Charcoal's primary button style.
    /// 
    /// - Parameters:
    ///   - size: The size of the button.
    ///   - isFixed: Whether the button should have a fixed width.
    ///   - primaryColor: The primary color of the button.
    @warn_unqualified_access
    func charcoalPrimaryButton(
        size: CharcoalButtonSize = .medium,
        isFixed: Bool = true,
        primaryColor: Color = Color(CharcoalAsset.ColorPaletteGenerated.brand.color)
    ) -> some View {
        return modifier(CharcoalPrimaryButtonStyleModifier(size: size, isFixed: isFixed, primaryColor: primaryColor))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Primary Button M") {}
            .charcoalPrimaryButton(size: .medium)
        Button("Primary Button M") {}
            .charcoalPrimaryButton(size: .medium)
            .disabled(true)
        Button("Primary Button S") {}
            .charcoalPrimaryButton(size: .small)
        Button("Primary Button S") {}
            .charcoalPrimaryButton(size: .small)
            .disabled(true)
    }
}
