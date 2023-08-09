import SwiftUI

@available(iOS 13, *)
struct CharcoalPrimaryButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let primaryColor: Color

    var body: some View {
        label
            .font(.system(size: 14, weight: .bold))
            .charcoalOnSurfaceText5()
            .padding(size == .medium ? 24 : 16)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .frame(height: size == .medium ? 40 : 32)
            .background(primaryColor)
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .charcoalForegroundColor(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size == .medium ? 20 : 16)
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

@available(iOS 13, *)
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

@available(iOS 13, *)
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

@available(iOS 13, *)
public extension View {
    func charcoalPrimaryButton(
        size: CharcoalButtonSize = .medium,
        isFixed: Bool = true,
        primaryColor: Color = Color(CharcoalAsset.ColorPaletteGenerated.brand.color)
    ) -> some View {
        return modifier(CharcoalPrimaryButtonStyleModifier(size: size, isFixed: isFixed, primaryColor: primaryColor))
    }
}
