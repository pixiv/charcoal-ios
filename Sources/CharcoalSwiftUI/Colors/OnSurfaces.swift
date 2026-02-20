import SwiftUI

struct CharcoalOnSurfaceBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .border)
    }
}

struct CharcoalOnSurfaceLink1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .link1)
    }
}

struct CharcoalOnSurfaceLink2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .link2)
    }
}

struct CharcoalOnSurfaceText1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .text1)
    }
}

struct CharcoalOnSurfaceText2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .text2)
    }
}

struct CharcoalOnSurfaceText3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .text3)
    }
}

struct CharcoalOnSurfaceText4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .text4)
    }
}

struct CharcoalOnSurfaceText5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .text5)
    }
}

struct CharcoalOnSurfaceIcon6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .icon6)
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceBorder() -> some View {
        modifier(CharcoalOnSurfaceBorder())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceLink1() -> some View {
        modifier(CharcoalOnSurfaceLink1())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceLink2() -> some View {
        modifier(CharcoalOnSurfaceLink2())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceText1() -> some View {
        modifier(CharcoalOnSurfaceText1())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceText2() -> some View {
        modifier(CharcoalOnSurfaceText2())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceText3() -> some View {
        modifier(CharcoalOnSurfaceText3())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceText4() -> some View {
        modifier(CharcoalOnSurfaceText4())
    }
}

public extension View {
    @available(*, deprecated, message: "Use foregroundStyle(charcoalColor:) instead.")
    func charcoalOnSurfaceText5() -> some View {
        modifier(CharcoalOnSurfaceText5())
    }
}
