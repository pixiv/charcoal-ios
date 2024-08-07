import SwiftUI

private let fontSize = CGFloat(CharcoalTypography.textFontSize1.value)
private let lineHeight = CGFloat(CharcoalTypography.textLineHeight1.value)

public extension View {
    @warn_unqualified_access
    func charcoalTypography12Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: .body
        ))
    }

    @warn_unqualified_access
    func charcoalTypography12Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: .body
        ))
    }

    @warn_unqualified_access
    func charcoalTypography12BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold,
            textStyle: .body
        ))
    }

    @warn_unqualified_access
    func charcoalTypography12RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular,
            textStyle: .body
        ))
    }
}
