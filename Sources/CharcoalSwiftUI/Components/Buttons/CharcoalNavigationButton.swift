import SwiftUI

struct CharcoalNavigationButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool

    @ScaledMetric var fontSize: CGFloat

    @ScaledMetric var cornerRadius: CGFloat

    init(label: ButtonStyleConfiguration.Label, isPressed: Bool, isEnabled: Bool, size: CharcoalButtonSize, isFixed: Bool) {
        self.label = label
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.size = size
        self.isFixed = isFixed
        _fontSize = ScaledMetric(wrappedValue: size.fontSize)
        _cornerRadius = ScaledMetric(wrappedValue: size.cornerRadius)
    }

    var body: some View {
        return AnyView(label
            .font(.system(size: fontSize, weight: .bold))
            .charcoalText(applyToken: .onHUD, state: isPressed ? .press : .default)
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .charcoalContainer(applyToken: .hud, state: isPressed ? .press : .default)
            .cornerRadius(cornerRadius)
            .opacity(isEnabled ? 1 : 0.32)
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
    func charcoalNavigationButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return modifier(CharcoalNavigationButtonStyleModifier(size: size, isFixed: isFixed))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Navigation M") {}
            .charcoalNavigationButton(size: .medium)
        Button("Navigation M") {}
            .charcoalNavigationButton(size: .medium)
            .disabled(true)
        Button("Navigation S") {}
            .charcoalNavigationButton(size: .small)
        Button("Navigation S") {}
            .charcoalNavigationButton(size: .small)
            .disabled(true)
    }
}
