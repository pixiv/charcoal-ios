import SwiftUI

struct CharcoalForegroundStyle: ViewModifier {
    let charcoalColor: CharcoalAsset.ColorPaletteGenerated

    func body(content: Content) -> some View {
        content.backport.foregroundStyle(Color(charcoalColor.color))
    }
}

public extension View {
    func foregroundStyle(charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> some View {
        modifier(CharcoalForegroundStyle(charcoalColor: charcoalColor))
    }
}

public extension Text {
    func foregroundStyle(charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> Text {
        self.backport.foregroundStyle(charcoalColor.colorAsset.swiftUIColor)
    }
}

#Preview {
    VStack {
        Text("Charcoal")
            .foregroundStyle(charcoalColor: .brand)

        Text("Attributed")
            .foregroundStyle(charcoalColor: .brand)
        +
        Text("String")
            .foregroundStyle(charcoalColor: .text3)
    }
}
