import SwiftUI

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

extension Backport where Content == Text {
    func foregroundStyle(_ color: Color) -> Text {
        if #available(iOS 17, *) {
            content
                .foregroundStyle(color)
        } else {
            content
                .foregroundColor(color)
        }
    }
}
