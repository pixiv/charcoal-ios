import SwiftUI

struct CharcoalDefaultButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    
    @ScaledMetric(relativeTo: .body)
    private var fontSize: CGFloat = 14

    var body: some View {
        label
            .font(.system(size: fontSize, weight: .bold))
            .charcoalOnSurfaceText2()
            .padding(size == .medium ? CharcoalButtonSize.medium.padding : CharcoalButtonSize.small.padding)
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
    @warn_unqualified_access
    func charcoalDefaultButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalDefaultButtonStyleModifier(size: size, isFixed: isFixed))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Default Button M") {}
            .charcoalDefaultButton(size: .medium)
        Button("Default Button M") {}
            .charcoalDefaultButton(size: .medium)
            .disabled(true)
        Button("Default Button S") {}
            .charcoalDefaultButton(size: .small)
        Button("Default Button S") {}
            .charcoalDefaultButton(size: .small)
            .disabled(true)
    }
}
