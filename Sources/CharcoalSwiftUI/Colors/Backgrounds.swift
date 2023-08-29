import SwiftUI

struct CharcoalBackground1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.background1.color))
    }
}

struct CharcoalBackground2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.background2.color))
    }
}

public extension View {
    func charcoalBackground1() -> some View {
        modifier(CharcoalBackground1())
    }
}

public extension View {
    func charcoalBackground2() -> some View {
        modifier(CharcoalBackground2())
    }
}
