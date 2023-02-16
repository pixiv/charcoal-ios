import SwiftUI

@available(iOS 13, *)
struct CharcoalPrimaryButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let color: Color

    var body: some View {
        label
            .font(.system(size: 14, weight: .bold))
            .charcoalOnSurfaceText5()
            .padding(size == .medium ? 24 : 16)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .frame(height: size == .medium ? 40 : 32)
            .background(color)
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .foregroundColor(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size == .medium ? 20 : 16)
    }
}

@available(iOS 15, *)
struct CharcoalPrimaryButtonStyleIos15: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool
    let color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalPrimaryButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed,
            color: color
        )
    }
}

@available(iOS 13, *)
struct CharcoalPrimaryButtonStyle: ButtonStyle {
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalPrimaryButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed,
            color: color
        )
    }
}

@available(iOS 13, *)
struct CharcoalPrimaryButtonStyleModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool
    let color: Color

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.buttonStyle(CharcoalPrimaryButtonStyleIos15(size: size, isFixed: isFixed, color: color))
        } else {
            content.buttonStyle(CharcoalPrimaryButtonStyle(isEnabled: isEnabled, size: size, isFixed: isFixed, color: color))
        }
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalPrimaryButton(
        size: CharcoalButtonSize = .medium,
        isFixed: Bool = true,
        color: Color = Color(CharcoalAsset.ColorPaletteGenerated.brand.color)
    ) -> some View {
        return modifier(CharcoalPrimaryButtonStyleModifier(size: size, isFixed: isFixed, color: color))
    }
}
