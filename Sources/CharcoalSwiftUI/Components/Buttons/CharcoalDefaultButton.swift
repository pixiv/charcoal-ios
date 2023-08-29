import SwiftUI

struct CharcoalDefaultButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool

    var body: some View {
        label
            .font(.system(size: 14, weight: .bold))
            .charcoalOnSurfaceText2()
            .padding(size == .medium ? 24 : 16)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .frame(height: size == .medium ? 40 : 32)
            .charcoalSurface3()
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .backport.foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size == .medium ? 20 : 16)
    }
}

@available(iOS 15, *)
struct CharcoalDefaultButtonStyleIos15: ButtonStyle {
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

struct CharcoalDefaultButtonStyle: ButtonStyle {
    let isEnabled: Bool
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
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.buttonStyle(CharcoalDefaultButtonStyleIos15(size: size, isFixed: isFixed))
        } else {
            content.buttonStyle(CharcoalDefaultButtonStyle(isEnabled: isEnabled, size: size, isFixed: isFixed))
        }
    }
}

public extension View {
    func charcoalDefaultButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalDefaultButtonStyleModifier(size: size, isFixed: isFixed))
    }
}
