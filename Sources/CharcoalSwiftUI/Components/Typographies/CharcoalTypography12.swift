import SwiftUI

private let fontSize = CGFloat(charcoalFoundation.typography.size.the12.fontSize)
private let lineHeight = CGFloat(charcoalFoundation.typography.size.the12.lineHeight)

public extension View {
    func charcoalTypography12Bold(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .bold,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: .body
        ))
    }

    func charcoalTypography12Regular(isSingleLine: Bool = false) -> some View {
        return modifier(CharcoalFontModifier(
            size: fontSize,
            weight: .regular,
            lineHeight: lineHeight,
            isSingleLine: isSingleLine,
            textStyle: .body
        ))
    }

    func charcoalTypography12BoldMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .bold,
            textStyle: .body
        ))
    }

    func charcoalTypography12RegularMono() -> some View {
        return modifier(CharcoalMonoFontModifier(
            size: fontSize,
            weight: .regular,
            textStyle: .body
        ))
    }
}

#if compiler(>=6.0)
    @available(iOS 17, *)
    #Preview {
        
        @Previewable @State var text = "123Appleでの日本語Mix한국어简体中文"
        
        VStack {
            Text(text)
                .font(.custom(".AppleSystemUIFont", size: 12))
                
            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .charcoalTypography12Regular(isSingleLine: false)
                
                Text(text)
                    .charcoalTypography12Bold(isSingleLine: false)
                
                Text(text)
                    .charcoalTypography12BoldMono()
                
                Text(text)
                    .charcoalTypography12RegularMono()
                
                Text(text)
                    .font(.custom("Hiragino Sans", size: 12))
                
                Text(text)
                    .font(.custom("PingFang SC", size: 12))
            }.background(charcoalColor: .background2)
        }
    }
#endif
