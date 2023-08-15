import SwiftUI

@available(iOS 13, *)
struct CharcoalOnSurfaceBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.border.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceLink1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.link1.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceLink2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.link2.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceText1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text1.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceText2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text2.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceText3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text3.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceText4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text4.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceText5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))
    }
}

@available(iOS 13, *)
struct CharcoalOnSurfaceIcon6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .charcoalForegroundColor(Color(CharcoalAsset.ColorPaletteGenerated.icon6.color))
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceBorder() -> some View {
        modifier(CharcoalOnSurfaceBorder())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceLink1() -> some View {
        modifier(CharcoalOnSurfaceLink1())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceLink2() -> some View {
        modifier(CharcoalOnSurfaceLink2())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceText1() -> some View {
        modifier(CharcoalOnSurfaceText1())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceText2() -> some View {
        modifier(CharcoalOnSurfaceText2())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceText3() -> some View {
        modifier(CharcoalOnSurfaceText3())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceText4() -> some View {
        modifier(CharcoalOnSurfaceText4())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalOnSurfaceText5() -> some View {
        modifier(CharcoalOnSurfaceText5())
    }
}

