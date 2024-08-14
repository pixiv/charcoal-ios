import SwiftUI

private let fontSize = CGFloat(CharcoalFoundation.Typography.fontSize30.value)
private let lineHeight = CGFloat(CharcoalFoundation.Typography.lineHeight30.value)

public extension View {
    @warn_unqualified_access
    func charcoalTypography20Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @warn_unqualified_access
    func charcoalTypography20Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @warn_unqualified_access
    func charcoalTypography20BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold
        ))
    }

    @warn_unqualified_access
    func charcoalTypography20RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular
        ))
    }
}
