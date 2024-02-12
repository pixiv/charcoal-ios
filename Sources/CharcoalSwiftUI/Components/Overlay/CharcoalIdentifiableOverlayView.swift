import SwiftUI

struct CharcoalIdentifiableOverlayView: View {
    typealias IDValue = UUID
    let id: IDValue
    var contentView: AnyView
    @Binding var isPresenting: Bool

    var body: some View {
        VStack {
            if isPresenting {
                contentView
            }
        }.animation(.easeInOut(duration: 0.2), value: isPresenting)
    }
}
