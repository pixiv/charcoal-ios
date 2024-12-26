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

#Preview {
    VStack {
        Text("Appleでの日本語Mix深圳")
            .font(.custom(".AppleSystemUIFont", size: 12))
            
        VStack(alignment: .leading, spacing: 4) {
            Text("Appleでの日本語Mix深圳")
                .charcoalTypography12Regular(isSingleLine: false)
            
            Text("Appleでの日本語Mix深圳")
                .charcoalTypography12Bold(isSingleLine: false)
            
            Text("Appleでの日本語Mix深圳")
                .charcoalTypography12BoldMono()
            
            Text("Appleでの日本語Mix深圳")
                .charcoalTypography12RegularMono()
            
            Text("Appleでの日本語Mix深圳")
                .font(.custom("Hiragino Sans", size: 12))
        }.background(charcoalColor: .background2)
    }
}
