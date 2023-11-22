import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the20.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the20.lineHeight)

public extension View {
    @warn_unqualified_access
    func charcoalTypography20Bold(isSingleLine: Bool = false, textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: textStyle
        ))
    }

    @warn_unqualified_access
    func charcoalTypography20Regular(isSingleLine: Bool = false, textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: textStyle
        ))
    }

    @warn_unqualified_access
    func charcoalTypography20BoldMono(textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold,
            textStyle: textStyle
        ))
    }

    @warn_unqualified_access
    func charcoalTypography20RegularMono(textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular,
            textStyle: textStyle
        ))
    }
}
