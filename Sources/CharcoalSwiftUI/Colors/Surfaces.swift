import SwiftUI

struct CharcoalSurface1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerDefault.value))
    }
}

struct CharcoalSurface2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerTertiaryDefault.value))
    }
}

struct CharcoalSurface3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerSecondaryDefault.value))
    }
}

struct CharcoalSurface4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerNeutralDefault.value))
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
            .background(Color(CharcoalFoundation.Colors.containerHudDefault.value))
    }
}

struct CharcoalSurface7: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerTertiaryDefault.value))
    }
}

struct CharcoalSurface8: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerHudDefault.value))
    }
}

struct CharcoalSurface9: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(CharcoalFoundation.Colors.containerDefault.value))
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface1() -> some View {
        modifier(CharcoalSurface1())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface2() -> some View {
        modifier(CharcoalSurface2())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface3() -> some View {
        modifier(CharcoalSurface3())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface4() -> some View {
        modifier(CharcoalSurface4())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface5() -> some View {
        modifier(CharcoalSurface5())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface6() -> some View {
        modifier(CharcoalSurface6())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface7() -> some View {
        modifier(CharcoalSurface7())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface8() -> some View {
        modifier(CharcoalSurface8())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalSurface9() -> some View {
        modifier(CharcoalSurface9())
    }
}
