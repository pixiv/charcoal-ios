import SwiftUI

struct CharcoalForegroundStyle: ViewModifier {
    let charcoalColor: CharcoalAsset.ColorPaletteGenerated

    func body(content: Content) -> some View {
        content.foregroundStyle(Color(charcoalColor: charcoalColor))
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(Color(charcoalColor:)) instead.")
    func foregroundStyle(charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> some View {
        modifier(CharcoalForegroundStyle(charcoalColor: charcoalColor))
    }
}

public extension Text {
    @available(*, deprecated, message: "Use foregroundStyle(Color(charcoalColor:)) instead.")
    func foregroundStyle(charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> Text {
        if #available(iOS 17, *) {
            foregroundStyle(Color(charcoalColor: charcoalColor))
        } else {
            foregroundColor(Color(charcoalColor: charcoalColor))
        }
    }
}

#Preview {
    VStack {
        Text("Charcoal")
            .foregroundStyle(Color(charcoalColor: .brand))

        Text("Attributed")
            .foregroundStyle(Color(charcoalColor: .brand))

        Text("String")
            .foregroundStyle(Color(charcoalColor: .text3))
    }
}
