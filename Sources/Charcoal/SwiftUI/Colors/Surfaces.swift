import SwiftUI

@available(iOS 13, *)
struct CharcoalSurface1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface1.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface2.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface3.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface4.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(CharcoalAsset.ColorPaletteGenerated.surface50.color),
                        Color(CharcoalAsset.ColorPaletteGenerated.surface5100.color)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

@available(iOS 13, *)
struct CharcoalSurface6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface6.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface7: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface7.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface8: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface8.color))
    }
}

@available(iOS 13, *)
struct CharcoalSurface9: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface9.color))
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface1() -> some View {
        modifier(CharcoalSurface1())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface2() -> some View {
        modifier(CharcoalSurface2())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface3() -> some View {
        modifier(CharcoalSurface3())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface4() -> some View {
        modifier(CharcoalSurface4())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface5() -> some View {
        modifier(CharcoalSurface5())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface6() -> some View {
        modifier(CharcoalSurface6())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface7() -> some View {
        modifier(CharcoalSurface7())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface8() -> some View {
        modifier(CharcoalSurface8())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalSurface9() -> some View {
        modifier(CharcoalSurface9())
    }
}
