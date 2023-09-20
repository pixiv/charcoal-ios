import SwiftUI

public extension View {
    @ViewBuilder func foregroundStyle(charcoalColor:  CharcoalAsset.ColorPaletteGenerated) -> some View {
        backport.foregroundStyle(Color(charcoalColor.color))
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
