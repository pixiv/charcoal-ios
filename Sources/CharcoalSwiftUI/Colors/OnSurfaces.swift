import SwiftUI

struct CharcoalOnSurfaceBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .borderDefault)
    }
}

struct CharcoalOnSurfaceLink1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textInfoDefault)
    }
}

struct CharcoalOnSurfaceLink2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textInfoDefault)
    }
}

struct CharcoalOnSurfaceText1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textDefault)
    }
}

struct CharcoalOnSurfaceText2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textSecondaryDefault)
    }
}

struct CharcoalOnSurfaceText3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textTertiaryDefault)
    }
}

struct CharcoalOnSurfaceText4: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textTertiaryDefault)
    }
}

struct CharcoalOnSurfaceText5: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .textOnPrimaryDefault)
    }
}

struct CharcoalOnSurfaceIcon6: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(charcoalColor: .iconDefault)
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceBorder() -> some View {
        modifier(CharcoalOnSurfaceBorder())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceLink1() -> some View {
        modifier(CharcoalOnSurfaceLink1())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceLink2() -> some View {
        modifier(CharcoalOnSurfaceLink2())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceText1() -> some View {
        modifier(CharcoalOnSurfaceText1())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceText2() -> some View {
        modifier(CharcoalOnSurfaceText2())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceText3() -> some View {
        modifier(CharcoalOnSurfaceText3())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceText4() -> some View {
        modifier(CharcoalOnSurfaceText4())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalOnSurfaceText5() -> some View {
        modifier(CharcoalOnSurfaceText5())
    }
}
