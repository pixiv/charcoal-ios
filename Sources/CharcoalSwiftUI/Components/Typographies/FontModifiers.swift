import SwiftUI

struct CharcoalFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight
    let lineHeight: CGFloat
    let isSingleLine: Bool

    func body(content: Content) -> some View {
        let font: UIFont = .systemFont(ofSize: size, weight: weight)
        return content
            .font(Font(font))
            .lineSpacing(isSingleLine ? 0 : lineHeight - font.lineHeight)
            .padding(.vertical, isSingleLine ? 0 : (lineHeight - font.lineHeight) / 2)
            .lineLimit(isSingleLine ? 1 : nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct CharcoalMonoFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight

    func body(content: Content) -> some View {
        let font: UIFont = .monospacedSystemFont(ofSize: size, weight: weight)
        return content
            .font(Font(font))
            .lineLimit(1)
    }
}
