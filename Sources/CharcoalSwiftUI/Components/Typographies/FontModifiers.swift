import SwiftUI

struct CharcoalFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight
    let isSingleLine: Bool
    let textStyle: Font.TextStyle

    @ScaledMetric var fontSize: CGFloat
    @ScaledMetric var lineHeight: CGFloat

    init(size: CGFloat, weight: UIFont.Weight, lineHeight: CGFloat, isSingleLine: Bool, textStyle: Font.TextStyle = .body) {
        self.size = size
        self.weight = weight
        self.isSingleLine = isSingleLine
        self.textStyle = textStyle
        _fontSize = ScaledMetric(wrappedValue: size, relativeTo: textStyle)
        _lineHeight = ScaledMetric(wrappedValue: lineHeight, relativeTo: textStyle)
    }

    func body(content: Content) -> some View {
        let font: UIFont = .systemFont(ofSize: fontSize, weight: weight)
        var attributes: [UIFontDescriptor.AttributeName : Any] = [:]
        var traits:  [UIFontDescriptor.TraitKey: Any] = [:]
        traits[.weight] = weight
        attributes[UIFontDescriptor.AttributeName.name] = nil
        attributes[UIFontDescriptor.AttributeName.family] = "Hiragino Sans"
        attributes[UIFontDescriptor.AttributeName.traits] = traits
        let fallbackFont = UIFontDescriptor(fontAttributes: attributes)
        let repaired = font.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList : [fallbackFont]])
        return content
            .font(Font(UIFont(descriptor: repaired, size: size)))
            .lineSpacing(isSingleLine ? 0 : lineHeight - font.lineHeight)
            .padding(.vertical, isSingleLine ? 0 : (lineHeight - font.lineHeight) / 2)
            .lineLimit(isSingleLine ? 1 : nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct CharcoalMonoFontModifier: ViewModifier {
    let size: CGFloat
    let weight: UIFont.Weight
    let textStyle: Font.TextStyle

    @ScaledMetric var fontSize: CGFloat

    init(size: CGFloat, weight: UIFont.Weight, textStyle: Font.TextStyle = .body) {
        self.size = size
        self.weight = weight
        self.textStyle = textStyle
        _fontSize = ScaledMetric(wrappedValue: size, relativeTo: textStyle)
    }

    func body(content: Content) -> some View {
        let font: UIFont = .monospacedSystemFont(ofSize: fontSize, weight: weight)
        var attributes: [UIFontDescriptor.AttributeName : Any] = [:]
        var traits: [UIFontDescriptor.TraitKey: Any] = [:]
        traits[.weight] = weight
        attributes[UIFontDescriptor.AttributeName.name] = nil
        attributes[UIFontDescriptor.AttributeName.family] = "Hiragino Sans"
        attributes[UIFontDescriptor.AttributeName.traits] = traits
        let fallbackFont = UIFontDescriptor(fontAttributes: attributes)
        let repaired = font.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList : [fallbackFont]])
        return content
            .font(Font(UIFont(descriptor: repaired, size: size)))
            .lineLimit(1)
    }
}
