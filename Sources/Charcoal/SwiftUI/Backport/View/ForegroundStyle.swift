import SwiftUI

@available(iOS 13, *)
extension Backport where Content: View {
    func foregroundStyle(_ color: Color) -> some View {
        if #available(iOS 15, *) {
           return content
                .foregroundStyle(color)
        } else {
           return content
                .foregroundColor(color)
        }
    }
}
