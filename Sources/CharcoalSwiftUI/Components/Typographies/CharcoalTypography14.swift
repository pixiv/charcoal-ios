import SwiftUI

private let the14FontSize = CGFloat(charcoalFoundation.typography.size.the14.fontSize)
private let the14LineHeight = CGFloat(charcoalFoundation.typography.size.the14.lineHeight)

public extension View {
    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography14Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the14FontSize,
            weight: .bold,
            lineHeight: the14LineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography14Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the14FontSize,
            weight: .regular,
            lineHeight: the14LineHeight,
            isSingleLine: isSingleLine
        ))
    }

    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography14BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the14FontSize,
            weight: .bold
        ))
    }

    @available(*, deprecated, message: "Use font(charcoalSize:weight:mono:isSingleLine:textStyle:) instead.")
    func charcoalTypography14RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the14FontSize,
            weight: .regular
        ))
    }
}
