import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the16.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the16.lineHeight)

@available(iOS 13, *)
public extension View {
    func charcoalTypography16Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography16Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography16BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold
        ))
    }

    func charcoalTypography16RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular
        ))
    }
}
