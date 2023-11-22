import SwiftUI

struct CharcoalDefaultOverlayButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    
    @Environment(\.sizeCategory) var sizeCategory

    var body: some View {
        label
            .font(.system(size: size.fontSize, weight: .bold))
            .charcoalOnSurfaceText2()
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .charcoalSurface3()
            .opacity(isEnabled ? 1.0 : 0.32)
            .overlay(
                Rectangle()
                    .backport.foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size.cornerRadius)
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
    @warn_unqualified_access
    func charcoalDefaultOverlayButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalDefaultOverlayButtonStyleModifier(size: size, isFixed: isFixed))
    }
}
