import SwiftUI

private let fontSize = CGFloat(CharcoalFoundation.Typography.fontSize1.value)
private let lineHeight = CGFloat(CharcoalFoundation.Typography.lineHeight1.value)

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
