import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the20.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the20.lineHeight)

@available(iOS 13, *)
public extension View {
    func charcoalTypography20Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography20Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography20BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold
        ))
    }

    func charcoalTypography20RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular
        ))
    }
}
