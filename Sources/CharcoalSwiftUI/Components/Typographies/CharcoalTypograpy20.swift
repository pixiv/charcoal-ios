import SwiftUI

private let the20FontSize = CGFloat(charcoalFoundation.typography.size.the20.fontSize)
private let the20LineHeight = CGFloat(charcoalFoundation.typography.size.the20.lineHeight)

public extension View {
    func charcoalTypography20Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the20FontSize,
            weight: .bold,
            lineHeight: the20LineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography20Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the20FontSize,
            weight: .regular,
            lineHeight: the20LineHeight,
            isSingleLine: isSingleLine
        ))
    }

    func charcoalTypography20BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the20FontSize,
            weight: .bold
        ))
    }

    func charcoalTypography20RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the20FontSize,
            weight: .regular
        ))
    }
}
