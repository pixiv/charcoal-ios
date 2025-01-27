import SwiftUI

struct CharcoalFontModifier: ViewModifier, CharcoalFontModifierProtocol {
    @EnvironmentObject var settings: CharcoalConfig.GlobalSettings
    
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
        let fontFallbacks = settings.fontFallback.compactMap({ createFallbackFont(name: $0, weight: weight) })
        let repaired = font.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList : fontFallbacks])
        
        return content
            .font(Font(UIFont(descriptor: repaired, size: size)))
            .lineSpacing(isSingleLine ? 0 : lineHeight - font.lineHeight)
            .padding(.vertical, isSingleLine ? 0 : (lineHeight - font.lineHeight) / 2)
            .lineLimit(isSingleLine ? 1 : nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct CharcoalMonoFontModifier: ViewModifier, CharcoalFontModifierProtocol {
    @EnvironmentObject var settings: CharcoalConfig.GlobalSettings
    
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
        let fontFallbacks = settings.monoFontFallback.compactMap({ createFallbackFont(name: $0, weight: weight) })
        let repaired = font.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList : fontFallbacks])
        return content
            .font(Font(UIFont(descriptor: repaired, size: size)))
            .lineLimit(1)
    }
}

protocol CharcoalFontModifierProtocol {
    func createFallbackFont(name: String, weight: UIFont.Weight) -> UIFontDescriptor
}

extension CharcoalFontModifierProtocol {
    func createFallbackFont(name: String, weight: UIFont.Weight) -> UIFontDescriptor {
        var attributes: [UIFontDescriptor.AttributeName : Any] = [:]
        var traits:  [UIFontDescriptor.TraitKey: Any] = [:]
        traits[.weight] = weight
        attributes[UIFontDescriptor.AttributeName.name] = nil
        attributes[UIFontDescriptor.AttributeName.family] = name
        attributes[UIFontDescriptor.AttributeName.traits] = traits
        return  UIFontDescriptor(fontAttributes: attributes)
    }
}
