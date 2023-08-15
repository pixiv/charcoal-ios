import SwiftUI

@available(iOS 13, *)
extension Backport where Content: View {
    @ViewBuilder func foregroundStyle(_ color: Color) -> some View {
        if #available(iOS 15, *) {
            content
                .foregroundStyle(color)
        } else {
            content
                .foregroundColor(color)
        }
    }
}
