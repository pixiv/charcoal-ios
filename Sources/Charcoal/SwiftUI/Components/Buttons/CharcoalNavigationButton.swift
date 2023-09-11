import SwiftUI

struct CharcoalNavigationButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool

    var body: some View {
        guard isEnabled else {
            return AnyView(
                Spacer()
                    .frame(height: size == .medium ? 40 : 32)
            )
        }
        return AnyView(label
            .font(.system(size: 14, weight: .bold))
            .charcoalOnSurfaceText5()
            .padding(size == .medium ? 24 : 16)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .frame(height: size == .medium ? 40 : 32)
            .charcoalSurface6()
            .overlay(
                Rectangle()
                    .backport.foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size == .medium ? 20 : 16)
        )
    }
}

@available(iOS 15, *)
struct CharcoalNavigationButtonStyleIos15: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalNavigationButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed
        )
    }
}

struct CharcoalNavigationButtonStyle: ButtonStyle {
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalNavigationButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed
        )
    }
}

struct CharcoalNavigationButtonStyleModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.buttonStyle(CharcoalNavigationButtonStyleIos15(size: size, isFixed: isFixed))
        } else {
            content.buttonStyle(CharcoalNavigationButtonStyle(isEnabled: isEnabled, size: size, isFixed: isFixed))
        }
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalNavigationButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalNavigationButtonStyleModifier(size: size, isFixed: isFixed))
    }
}
