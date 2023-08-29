import SwiftUI
import CharcoalShared

struct CharcoalOnSurfaceBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.border.color))
    }
}

struct CharcoalOnSurfaceLink1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.link1.color))
    }
}

struct CharcoalOnSurfaceLink2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.link2.color))
    }
}

struct CharcoalOnSurfaceText1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.text1.color))
    }
}

struct CharcoalOnSurfaceText2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.text2.color))
    }
}

struct CharcoalOnSurfaceText3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.text3.color))
    }
}

struct CharcoalOnSurfaceText4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.text4.color))
    }
}

struct CharcoalOnSurfaceText5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))
    }
}

struct CharcoalOnSurfaceIcon6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .backport.foregroundStyle(Color(CharcoalAsset.ColorPaletteGenerated.icon6.color))
    }
}

public extension View {
    func charcoalOnSurfaceBorder() -> some View {
        modifier(CharcoalOnSurfaceBorder())
    }
}

public extension View {
    func charcoalOnSurfaceLink1() -> some View {
        modifier(CharcoalOnSurfaceLink1())
    }
}

public extension View {
    func charcoalOnSurfaceLink2() -> some View {
        modifier(CharcoalOnSurfaceLink2())
    }
}

public extension View {
    func charcoalOnSurfaceText1() -> some View {
        modifier(CharcoalOnSurfaceText1())
    }
}

public extension View {
    func charcoalOnSurfaceText2() -> some View {
        modifier(CharcoalOnSurfaceText2())
    }
}

public extension View {
    func charcoalOnSurfaceText3() -> some View {
        modifier(CharcoalOnSurfaceText3())
    }
}

public extension View {
    func charcoalOnSurfaceText4() -> some View {
        modifier(CharcoalOnSurfaceText4())
    }
}

public extension View {
    func charcoalOnSurfaceText5() -> some View {
        modifier(CharcoalOnSurfaceText5())
    }
}

