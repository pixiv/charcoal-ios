import SwiftUI

private let the12FontSize = CGFloat(charcoalFoundation.typography.size.the12.fontSize)
private let the12LineHeight = CGFloat(charcoalFoundation.typography.size.the12.lineHeight)

public extension View {
    func charcoalTypography12Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the12FontSize,
            weight: .bold,
            lineHeight: the12LineHeight,
            isSingleLine: isSingleLine,
            textStyle: .body
        ))
    }

    func charcoalTypography12Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: the12FontSize,
            weight: .regular,
            lineHeight: the12LineHeight,
            isSingleLine: isSingleLine,
            textStyle: .body
        ))
    }

    func charcoalTypography12BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the12FontSize,
            weight: .bold,
            textStyle: .body
        ))
    }

    func charcoalTypography12RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: the12FontSize,
            weight: .regular,
            textStyle: .body
        ))
    }
}
