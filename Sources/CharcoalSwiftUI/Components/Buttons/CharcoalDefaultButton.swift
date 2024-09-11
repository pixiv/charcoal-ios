import SwiftUI

struct CharcoalDefaultButtonStyleView: View {
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
        label
            .font(.system(size: fontSize, weight: .bold))
            .charcoalText(applyToken: .onSecondary, state: isPressed ? .press : .default)
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .charcoalContainer(applyToken: .secondary, state: isPressed ? .press : .default)
            .opacity(isEnabled ? 1.0 : 0.32)
            .cornerRadius(cornerRadius)
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
