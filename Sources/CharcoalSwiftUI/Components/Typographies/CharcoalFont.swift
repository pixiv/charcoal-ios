import SwiftUI

public enum CharcoalFontSize {
    case the10
    case the12
    case the14
    case the16
    case the20

    var fontSize: CGFloat {
        switch self {
        case .the10:
            return 10
        case .the12:
            return CGFloat(charcoalFoundation.typography.size.the12.fontSize)
        case .the14:
            return CGFloat(charcoalFoundation.typography.size.the14.fontSize)
        case .the16:
            return CGFloat(charcoalFoundation.typography.size.the16.fontSize)
        case .the20:
            return CGFloat(charcoalFoundation.typography.size.the20.fontSize)
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .the10:
            return 18
        case .the12:
            return CGFloat(charcoalFoundation.typography.size.the12.lineHeight)
        case .the14:
            return CGFloat(charcoalFoundation.typography.size.the14.lineHeight)
        case .the16:
            return CGFloat(charcoalFoundation.typography.size.the16.lineHeight)
        case .the20:
            return CGFloat(charcoalFoundation.typography.size.the20.lineHeight)
        }
    }
}

public enum CharcoalFontWeight {
    case regular
    case bold

    var uiFontWeight: UIFont.Weight {
        switch self {
        case .regular:
            return .regular
        case .bold:
            return .bold
        }
    }
}

public extension View {
    func font(
        charcoalSize: CharcoalFontSize,
        weight: CharcoalFontWeight = .regular,
        mono: Bool = false,
        isSingleLine: Bool = false,
        textStyle: Font.TextStyle = .body
    ) -> some View {
        if mono {
            return AnyView(modifier(CharcoalMonoFontModifier(
                size: charcoalSize.fontSize,
                weight: weight.uiFontWeight,
                textStyle: textStyle
            )))
        }

        return AnyView(modifier(CharcoalFontModifier(
            size: charcoalSize.fontSize,
            weight: weight.uiFontWeight,
            lineHeight: charcoalSize.lineHeight,
            isSingleLine: isSingleLine,
            textStyle: textStyle
        )))
    }
}

public extension Text {
    func font(
        charcoalSize: CharcoalFontSize,
        weight: CharcoalFontWeight = .regular,
        mono: Bool = false
    ) -> Text {
        let fontName: String

        if mono {
            fontName = UIFont.monospacedSystemFont(ofSize: .zero, weight: weight.uiFontWeight).fontName
        } else {
            fontName = UIFont.systemFont(ofSize: .zero, weight: weight.uiFontWeight).fontName
        }

        return font(.custom(fontName, size: charcoalSize.fontSize, relativeTo: .body))
    }
}
