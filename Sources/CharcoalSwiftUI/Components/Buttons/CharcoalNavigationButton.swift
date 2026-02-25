import SwiftUI

struct CharcoalNavigationButtonStyleView: View {
    let label: ButtonStyleConfiguration.Label
    let isPressed: Bool
    let isEnabled: Bool
    let size: CharcoalButtonSize
    let isFixed: Bool

    @ScaledMetric var fontSize: CGFloat

    init(label: ButtonStyleConfiguration.Label, isPressed: Bool, isEnabled: Bool, size: CharcoalButtonSize, isFixed: Bool) {
        self.label = label
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.size = size
        self.isFixed = isFixed
        _fontSize = ScaledMetric(wrappedValue: size.fontSize)
    }

    var body: some View {
        guard isEnabled else {
            return AnyView(
                Spacer()
                    .frame(height: size == .medium ? 40 : 32)
            )
        }
        return AnyView(label
            .font(.system(size: fontSize, weight: .bold))
            .foregroundStyle(charcoalColor: .text5)
            .padding(size.padding)
            .frame(maxWidth: isFixed ? nil : .infinity)
            .background(charcoalColor: .surface6)
            .overlay(
                Rectangle()
                    .foregroundStyle(isPressed ? Color(CharcoalAsset.ColorPaletteGenerated.surface10.color) : .clear)
            )
            .clipShape(.charcoalCapsule)
            .hoverEffect(.lift)
        )
    }
}

struct CharcoalNavigationButtonStyle: ButtonStyle {
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

public extension View {
    /// Set the style of the button to Charcoal's navigation button
    ///
    /// - Parameters:
    ///   - size: The size of the button
    ///   - isFixed: Whether the button should have a fixed width
    @available(*, deprecated, message: "Use buttonStyle(_:) with CharcoalButtonStyle instead.")
    func charcoalNavigationButton(size: CharcoalButtonSize = .medium, isFixed: Bool = true) -> some View {
        return buttonStyle(.charcoalNavigation(.init(size: size, isFixed: isFixed)))
    }
}

#Preview {
    VStack(spacing: 8) {
        Button("Navigation M") {}
            .buttonStyle(.charcoalNavigation(.init(size: .medium, isFixed: true)))
        Button("Navigation M") {}
            .buttonStyle(.charcoalNavigation(.init(size: .medium, isFixed: true)))
            .disabled(true)
        Button("Navigation S") {}
            .buttonStyle(.charcoalNavigation(.init(size: .small, isFixed: true)))
        Button("Navigation S") {}
            .buttonStyle(.charcoalNavigation(.init(size: .small, isFixed: true)))
            .disabled(true)
    }
}
