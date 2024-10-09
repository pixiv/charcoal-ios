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

#Preview {
    ZStack {
        Text("Charcoal")
            .foregroundStyle(charcoalColor: .brand)
    }
}
