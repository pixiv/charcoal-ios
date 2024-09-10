import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the14.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the14.lineHeight)

public extension View {
    func charcoalTypography14Bold(isSingleLine: Bool = false) -> some View {
        return modifier(
            CharcoalFontModifier(
                size: fontSize,
                weight: .bold,
                lineHeight: lineHeight,
                isSingleLine: isSingleLine
            ))
    }

    func charcoalTypography14Regular(isSingleLine: Bool = false) -> some View {
        return modifier(
            CharcoalFontModifier(
                size: fontSize,
                weight: .regular,
                lineHeight: lineHeight,
                isSingleLine: isSingleLine
            ))
    }

    func charcoalTypography14BoldMono() -> some View {
        return modifier(
            CharcoalMonoFontModifier(
                size: fontSize,
                weight: .bold
            ))
    }

    func charcoalTypography14RegularMono() -> some View {
        return modifier(
            CharcoalMonoFontModifier(
                size: fontSize,
                weight: .regular
            ))
    }
}
