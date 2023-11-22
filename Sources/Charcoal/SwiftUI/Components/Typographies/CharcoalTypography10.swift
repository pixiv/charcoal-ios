import SwiftUI

public extension View {
    @warn_unqualified_access
    func charcoalTypography10Bold(isSingleLine: Bool = false, textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .bold, lineHeight: 18, isSingleLine: isSingleLine, textStyle: textStyle))
    }

    @warn_unqualified_access
    func charcoalTypography10Regular(isSingleLine: Bool = false, textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .regular, lineHeight: 18, isSingleLine: isSingleLine, textStyle: textStyle))
    }

    @warn_unqualified_access
    func charcoalTypography10BoldMono(textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .bold, textStyle: textStyle))
    }

    @warn_unqualified_access
    func charcoalTypography10RegularMono(textStyle: Font.TextStyle = .body) -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .regular, textStyle: textStyle))
    }
}
