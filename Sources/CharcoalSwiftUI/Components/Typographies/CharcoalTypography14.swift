import SwiftUI

private let fontSize = CGFloat(CharcoalTypography.textFontSize5)
private let lineHeight = CGFloat(CharcoalTypography.textLineHeight5)

public extension View {
    @warn_unqualified_access
    func charcoalTypography14Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @warn_unqualified_access
    func charcoalTypography14Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @warn_unqualified_access
    func charcoalTypography14BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold
        ))
    }

    @warn_unqualified_access
    func charcoalTypography14RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular
        ))
    }
}
