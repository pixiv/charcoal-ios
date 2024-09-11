import SwiftUI

struct CharcoalBackground: ViewModifier {
    let charcoalColor: CharcoalFoundation.Colors
    let edges: Edge.Set

    func body(content: Content) -> some View {
        content.backport.background(Color(charcoalColor.value), ignoresSafeAreaEdges: edges)
    }
}

struct CharcoalBackground1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(charcoalColor: .backgroundDefault)
    }
}

struct CharcoalBackground2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(charcoalColor: .backgroundSecondary)
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
    func background(charcoalColor: CharcoalFoundation.Colors, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View {
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
        .background(charcoalColor: .backgroundDefault)
    }
}

#Preview {
    BackgroundView()
}
