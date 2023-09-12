import SwiftUI

struct CharcoalBackground: ViewModifier {
    let charcoalColor: CharcoalAsset.ColorPaletteGenerated
    func body(content: Content) -> some View {
        content
            .background(Color(charcoalColor.color))
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
    func background(charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> some View {
        modifier(CharcoalBackground(charcoalColor: charcoalColor))
    }
}

// MARK: Development View

fileprivate struct BackgroundView: View {
    var body: some View {
        VStack {
            Text("Charcoal")
        }
        .charcoalBackground2()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
