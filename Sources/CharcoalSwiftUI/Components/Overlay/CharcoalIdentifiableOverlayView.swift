import SwiftUI

struct CharcoalIdentifiableOverlayView: View {
    typealias IDValue = UUID
    let id: IDValue
    var contentView: AnyView
    @Binding var isPresenting: Bool

    var body: some View {
        ZStack {
            if isPresenting {
                Color.clear
                    .contentShape(Rectangle())
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                isPresenting = false
                            }
                    )
                    .simultaneousGesture(
                        DragGesture()
                            .onChanged { _ in
                                isPresenting = false
                            }
                    )
                contentView
            }
        }.animation(.easeInOut(duration: 0.2), value: isPresenting)
    }
}
