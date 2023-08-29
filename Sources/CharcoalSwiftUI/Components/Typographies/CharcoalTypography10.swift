import SwiftUI

public extension View {
    func charcoalTypography10Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .bold, lineHeight: 18, isSingleLine: isSingleLine))
    }

    func charcoalTypography10Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .regular, lineHeight: 18, isSingleLine: isSingleLine))
    }

    func charcoalTypography10BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .bold))
    }

    func charcoalTypography10RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .regular))
    }
}
