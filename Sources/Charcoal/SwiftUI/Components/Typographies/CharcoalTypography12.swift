import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the12.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the12.lineHeight)

@available(iOS 13, *)
public extension View {
    func charcoalTypography12Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography12Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography12BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold
        ))
    }

    func charcoalTypography12RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular
        ))
    }
}
