import SwiftUI

private let the16FontSize = CGFloat(charcoalFoundation.typography.size.the16.fontSize)
private let the16LineHeight = CGFloat(charcoalFoundation.typography.size.the16.lineHeight)

public extension View {
    func charcoalTypography16Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the16FontSize,
            weight: .bold,
            lineHeight: the16LineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography16Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the16FontSize,
            weight: .regular,
            lineHeight: the16LineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography16BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the16FontSize,
            weight: .bold
        ))
    }

    func charcoalTypography16RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the16FontSize,
            weight: .regular
        ))
    }
}
