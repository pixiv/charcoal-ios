import SwiftUI

struct CharcoalIdentifiableOverlayView: View {
    typealias IDValue = UUID
    let id: IDValue
    let contentView: AnyView
    let dismissOnTouchOutside: Bool
    @Binding var isPresenting: Bool

    var body: some View {
        ZStack {
            if dismissOnTouchOutside && isPresenting {
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
            }
            if isPresenting {
                contentView
            }
        }.animation(.easeInOut(duration: 0.2), value: isPresenting)
    }
}
