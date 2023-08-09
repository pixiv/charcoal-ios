import SwiftUI

@available(iOS 13, *)
struct CharcoalDefaultOverlayButtonStyleView: View {
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
                    .charcoalForegroundColor(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size == .medium ? 20 : 16)
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

@available(iOS 13, *)
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
@available(iOS 13, *)
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

@available(iOS 13, *)
public extension View {
    func charcoalDefaultOverlayButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalDefaultOverlayButtonStyleModifier(size: size, isFixed: isFixed))
    }
}
