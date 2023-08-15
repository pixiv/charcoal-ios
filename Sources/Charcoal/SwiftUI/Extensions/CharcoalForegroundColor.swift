import SwiftUI

@available(iOS 13, *)
struct CharcoalForegroundColor: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content
                .foregroundStyle(color)
        } else {
            content
                .foregroundColor(color)
        }
    }
}

@available(iOS 13, *)
extension View {
    func charcoalForegroundColor(_ color: Color) -> some View {
        modifier(CharcoalForegroundColor(color: color))
    }
}
