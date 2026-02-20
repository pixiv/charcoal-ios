import SwiftUI

public extension View {
    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography10Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .bold, lineHeight: 18, isSingleLine: isSingleLine, textStyle: .body))
    }

    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography10Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(size: 10, weight: .regular, lineHeight: 18, isSingleLine: isSingleLine, textStyle: .body))
    }

    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography10BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .bold, textStyle: .body))
    }

    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography10RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(size: 10, weight: .regular, textStyle: .body))
    }
}
