import SwiftUI

struct CharcoalSurface1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface1.color))
    }
}

struct CharcoalSurface2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface2.color))
    }
}

struct CharcoalSurface3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface3.color))
    }
}

struct CharcoalSurface4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface4.color))
    }
}

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

struct CharcoalSurface6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface6.color))
    }
}

struct CharcoalSurface7: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface7.color))
    }
}

struct CharcoalSurface8: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface8.color))
    }
}

struct CharcoalSurface9: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface9.color))
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface1() -> some View {
        modifier(CharcoalSurface1())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface2() -> some View {
        modifier(CharcoalSurface2())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface3() -> some View {
        modifier(CharcoalSurface3())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface4() -> some View {
        modifier(CharcoalSurface4())
    }
}

public extension View {
    func charcoalSurface5() -> some View {
        modifier(CharcoalSurface5())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface6() -> some View {
        modifier(CharcoalSurface6())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface7() -> some View {
        modifier(CharcoalSurface7())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface8() -> some View {
        modifier(CharcoalSurface8())
    }
}

public extension View {
    @available(*, deprecated, message: "Use background(charcoalColor:) instead.")
    func charcoalSurface9() -> some View {
        modifier(CharcoalSurface9())
    }
}
