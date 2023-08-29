import SwiftUI

extension Backport where Content: View {
    @ViewBuilder func foregroundStyle(_ color: Color) -> some View {
        if #available(iOS 15, macOS 12, *) {
            content
                .foregroundStyle(color)
        } else {
            content
                .foregroundColor(color)
        }
    }
}
