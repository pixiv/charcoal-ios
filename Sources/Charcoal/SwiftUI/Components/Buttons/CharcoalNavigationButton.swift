import SwiftUI

struct CharcoalNavigationButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    
    @ScaledMetric(relativeTo: .body)
    private var fontSize: CGFloat = 14

    var body: some View {
        guard isEnabled else {
            return AnyView(
                Spacer()
                    .frame(height: size == .medium ? 40 : 32)
            )
        }
        return AnyView(label
            .font(.system(size: fontSize, weight: .bold))
            .charcoalOnSurfaceText5()
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .charcoalSurface6()
            .overlay(
                Rectangle()
                    .backport.foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .cornerRadius(size.cornerRadius)
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
