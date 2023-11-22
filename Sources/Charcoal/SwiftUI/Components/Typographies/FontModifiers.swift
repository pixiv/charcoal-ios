import SwiftUI

struct CharcoalFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight
    let lineHeight: CGFloat
    let isSingleLine: Bool
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var scaledFontSize: CGFloat {
        return UIFontMetrics.default.scaledValue(for: size)
    }
    
    var scaledLineHeight: CGFloat {
        return UIFontMetrics.default.scaledValue(for: lineHeight)
    }

    func body(content: Content) -> some View {
        let font: UIFont = .systemFont(ofSize: scaledFontSize, weight: weight)
        return content
            .font(Font(font))
            .lineSpacing(isSingleLine ? 0 : scaledLineHeight - font.lineHeight)
            .padding(.vertical, isSingleLine ? 0 : (scaledLineHeight - font.lineHeight) / 2)
            .lineLimit(isSingleLine ? 1 : nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct CharcoalMonoFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight
    
    var scaledFontSize: CGFloat {
        return UIFontMetrics.default.scaledValue(for: size)
    }

    func body(content: Content) -> some View {
        let font: UIFont = .monospacedSystemFont(ofSize: scaledFontSize, weight: weight)
        return content
            .font(Font(font))
            .lineLimit(1)
    }
}
