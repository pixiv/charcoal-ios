import SwiftUI

struct CharcoalPrimaryButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let containerToken: CharcoalApplyTokens.Containers

    @ScaledMetric var fontSize: CGFloat

    @ScaledMetric var cornerRadius: CGFloat

    init(label: ButtonStyleConfiguration.Label, isPressed: Bool, isEnabled: Bool, size: CharcoalButtonSize, isFixed: Bool, containerToken: CharcoalApplyTokens.Containers) {
        self.label = label
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.size = size
        self.isFixed = isFixed
        self.containerToken = containerToken
        _fontSize = ScaledMetric(wrappedValue: size.fontSize)
        _cornerRadius = ScaledMetric(wrappedValue: size.cornerRadius)
    }

    var body: some View {
        label
            .font(.system(size: fontSize, weight: .bold))
            .charcoalText(applyToken: .onPrimary, state: isPressed ? .press : .default)
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .charcoalContainer(applyToken: containerToken, state: isPressed ? .press : .default)
            .cornerRadius(cornerRadius)
            .opacity(isEnabled ? 1 : 0.32)
    }
}

@available(iOS 15, *)
struct CharcoalPrimaryButtonStyleIos15: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool
    let containerToken: CharcoalApplyTokens.Containers

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalPrimaryButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed,
            containerToken: containerToken
        )
    }
}

struct CharcoalPrimaryButtonStyle: ButtonStyle {
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool
    let containerToken: CharcoalApplyTokens.Containers

    func makeBody(configuration: Self.Configuration) -> some View {
        CharcoalPrimaryButtonStyleView(
            label: configuration.label,
            isPressed: configuration.isPressed,
            isEnabled: isEnabled,
            size: size,
            isFixed: isFixed,
            containerToken: containerToken
        )
    }
}

struct CharcoalPrimaryButtonStyleModifier: ViewModifier {
    @Environment(\.isEnabled) var isEnabled
    let size: CharcoalButtonSize
    let isFixed: Bool
    let containerToken: CharcoalApplyTokens.Containers

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            // swiftlint:disable line_length
            content.buttonStyle(CharcoalPrimaryButtonStyleIos15(size: size, isFixed: isFixed, containerToken: containerToken))
        } else {
            // swiftlint:disable line_length
            content.buttonStyle(CharcoalPrimaryButtonStyle(isEnabled: isEnabled, size: size, isFixed: isFixed, containerToken: containerToken))
        }
    }
}

public extension View {
    func charcoalPrimaryButton(
        size: CharcoalButtonSize = .medium,
        isFixed: Bool = true,
        containerToken: CharcoalApplyTokens.Containers = .primary
    ) -> some View {
        return modifier(CharcoalPrimaryButtonStyleModifier(size: size, isFixed: isFixed, containerToken: containerToken))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Primary Button M") {}
            .charcoalPrimaryButton(size: .medium)
        Button("Primary Button M") {}
            .charcoalPrimaryButton(size: .medium)
            .disabled(true)
        Button("Primary Button S") {}
            .charcoalPrimaryButton(size: .small)
        Button("Primary Button S") {}
            .charcoalPrimaryButton(size: .small)
            .disabled(true)
    }
}
