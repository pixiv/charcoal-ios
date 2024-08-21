import SwiftUI

struct CharcoalForegroundStyle: ViewModifier {
    let charcoalColor: CharcoalFoundation.Colors

    func body(content: Content) -> some View {
        content.backport.foregroundStyle(Color(charcoalColor.value))
    }
}

public extension View {
    func foregroundStyle(charcoalColor: CharcoalFoundation.Colors) -> some View {
        modifier(CharcoalForegroundStyle(charcoalColor: charcoalColor))
    }
}

// MARK: Development View

private struct ForegroundView: View {
    var body: some View {
        ZStack {
            Text("Charcoal")
                .foregroundStyle(charcoalColor: .pixiv)
        }
    }
}

#Preview {
    ForegroundView()
}
