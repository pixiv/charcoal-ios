import SwiftUI

struct CharcoalFontModifier: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let lineHeight: CGFloat
    let isSingleLine: Bool

    func body(content: Content) -> some View {
        var fontLineHeight = size
        let font = Font.system(size: size, design: .default).weight(weight)
        
        if let defalutFont = CTFontCreateUIFontForLanguage(.system, size, nil) {
            fontLineHeight = defalutFont.lineHeight
        }
       
        return content
            .font(font)
            .lineSpacing(isSingleLine ? 0 : lineHeight - fontLineHeight)
            .padding(.vertical, isSingleLine ? 0 : (lineHeight - fontLineHeight) / 2)
            .lineLimit(isSingleLine ? 1 : nil)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct CharcoalMonoFontModifier: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight

    func body(content: Content) -> some View {
        let font = Font.system(size: size, design: .monospaced).weight(weight)
        
        return content
            .font(font)
            .lineLimit(1)
    }
}

extension CTFont {
    var lineHeight: CGFloat {
        var lineHeight: CGFloat = 0.0
     
        // Get the ascent from the font, already scaled for the font's size
        lineHeight += CTFontGetAscent(self)
     
        // Get the descent from the font, already scaled for the font's size
        lineHeight += CTFontGetDescent(self)
     
        // Get the leading from the font, already scaled for the font's size
        lineHeight += CTFontGetLeading(self)
     
        return lineHeight;
    }
}
