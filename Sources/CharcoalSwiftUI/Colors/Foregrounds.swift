import SwiftUI

struct CharcoalForegroundStyle: ViewModifier {
    let charcoalColor: CharcoalAsset.ColorPaletteGenerated

    func body(content: Content) -> some View {
        content.foregroundStyle(Color(charcoalColor: charcoalColor))
    }
}

public extension View {
    func foregroundStyle(charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> some View {
        modifier(CharcoalForegroundStyle(charcoalColor: charcoalColor))
    }
}

public extension Text {
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
            .foregroundStyle(charcoalColor: .brand)

        Text("Attributed")
            .foregroundStyle(charcoalColor: .brand)

        Text("String")
            .foregroundStyle(charcoalColor: .text3)
    }
}
