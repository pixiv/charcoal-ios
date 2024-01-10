import SwiftUI

public extension View {
    @warn_unqualified_access
    func charcoalTypography10Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .bold, lineHeight: 18, isSingleLine: isSingleLine, textStyle: .body))
    }

    @warn_unqualified_access
    func charcoalTypography10Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .regular, lineHeight: 18, isSingleLine: isSingleLine, textStyle: .body))
    }

    @warn_unqualified_access
    func charcoalTypography10BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .bold, textStyle: .body))
    }

    @warn_unqualified_access
    func charcoalTypography10RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .regular, textStyle: .body))
    }
}
