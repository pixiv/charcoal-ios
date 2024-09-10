import SwiftUI

struct CharcoalBackground: ViewModifier {
    let charcoalColor: CharcoalAsset.ColorPaletteGenerated
    let edges: Edge.Set

    func body(content: Content) -> some View {
        content.backport.background(Color(charcoalColor.color), ignoresSafeAreaEdges: edges)
    }
}

struct CharcoalBackground1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(charcoalColor: .background1)
    }
}

struct CharcoalBackground2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(charcoalColor: .background2)
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

public extension View {
    func background(charcoalColor: CharcoalAsset.ColorPaletteGenerated, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View {
        modifier(CharcoalBackground(charcoalColor: charcoalColor, edges: edges))
    }
}

// MARK: Development View

private struct BackgroundView: View {
    var body: some View {
        ZStack {
            Text("Charcoal")
            Color.clear
        }
        .background(charcoalColor: .warning)
    }
}

#Preview {
    BackgroundView()
}
