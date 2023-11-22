import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the12.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the12.lineHeight)

public extension View {
    @warn_unqualified_access
    func charcoalTypography12Bold(isSingleLine: Bool = false, textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: textStyle
        ))
    }

    @warn_unqualified_access
    func charcoalTypography12Regular(isSingleLine: Bool = false, textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: textStyle
        ))
    }

    @warn_unqualified_access
    func charcoalTypography12BoldMono(textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold,
            textStyle: textStyle
        ))
    }

    @warn_unqualified_access
    func charcoalTypography12RegularMono(textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular,
            textStyle: textStyle
        ))
    }
}
