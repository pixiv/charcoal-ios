import SwiftUI

private let fontSize = CGFloat(CharcoalTypography.textFontSize10.value)
private let lineHeight = CGFloat(CharcoalTypography.textLineHeight10.value)

public extension View {
    @warn_unqualified_access
    func charcoalTypography16Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @warn_unqualified_access
    func charcoalTypography16Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @warn_unqualified_access
    func charcoalTypography16BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold
        ))
    }

    @warn_unqualified_access
    func charcoalTypography16RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular
        ))
    }
}
