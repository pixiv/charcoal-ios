import SwiftUI

struct CharcoalForegroundStyle: ViewModifier {
    let charcoalColor: CharcoalAsset.ColorPaletteGenerated
    
    func body(content: Content) -> some View {
        content.backport.foregroundStyle(Color(charcoalColor.color))
    }
}

public extension View {
    func foregroundStyle(charcoalColor:  CharcoalAsset.ColorPaletteGenerated) -> some View {
        modifier(CharcoalForegroundStyle(charcoalColor: charcoalColor))
    }
}

// MARK: Development View

fileprivate struct ForegroundView: View {
    var body: some View {
        ZStack {
            Text("Charcoal")
                .foregroundStyle(charcoalColor: .brand)
        }
    }
}

struct ForegroundView_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundView()
    }
}
