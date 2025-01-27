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
        
        let fallbackableFont: UIFontDescriptor
        
        if _settings.hasValue {
            let fontFallbacks = settings.fontFallback.compactMap({ createFallbackFont(name: $0, weight: weight) })
            fallbackableFont = font.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList : fontFallbacks])
        } else {
            fallbackableFont = font.fontDescriptor
        }
        
        return content
            .font(Font(UIFont(descriptor: fallbackableFont, size: size)))
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
        
        let fallbackableFont: UIFontDescriptor
        
        if _settings.hasValue {
            let fontFallbacks = settings.monoFontFallback.compactMap({ createFallbackFont(name: $0, weight: weight) })
            fallbackableFont = font.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList : fontFallbacks])
        } else {
            fallbackableFont = font.fontDescriptor
        }
        
        return content
            .font(Font(UIFont(descriptor: fallbackableFont, size: size)))
            .lineLimit(1)
    }
}
