import SwiftUI

struct CharcoalToastDraggableModifier: ViewModifier, CharcoalToastDraggable {
    let screenEdge: CharcoalPopupViewEdge

    @Binding var isPresenting: Bool

    @Binding var offset: CGSize

    @Binding var dragVelocity: CGSize

    @Binding var isDragging: Bool

    func body(content: Content) -> some View {
        content
            .offset(y: offset.height)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        let translationInDirection = gesture.translation.height * screenEdge.direction
                        dragVelocity = gesture.velocity

                        isDragging = true
                        if translationInDirection < 0 {
                            offset = CGSize(
                                width: 0,
                                height: gesture.translation.height
                            )
                        } else {
                            // Rubber band effect
                            let limit: CGFloat = 60
                            let yOff = gesture.translation.height
                            let dist = sqrt(yOff * yOff)
                            let factor = 1 / (dist / limit + 1)

                            offset = CGSize(
                                width: 0,
                                height: gesture.translation.height * factor
                            )
                        }
                    }
                    .onEnded { _ in
                        isDragging = false
                        let movingVelocityInDirection = dragVelocity.height * screenEdge.direction
                        let offsetInDirection = offset.height * screenEdge.direction

                        if offsetInDirection < -50 || movingVelocityInDirection < -100 {
                            // remove the card
                            isPresenting = false
                            let animation = Animation.interpolatingSpring(initialVelocity: dragVelocity.height)
                            withAnimation(animation) {
                                offset = .zero
                            }
                        } else {
                            withAnimation(.bouncy) {
                                offset = .zero
                            }
                        }
                    }
            )
    }
}

extension View {
    func charcoalDraggableToast(
        screenEdge: CharcoalPopupViewEdge,
        isPresenting: Binding<Bool>,
        offset: Binding<CGSize>,
        dragVelocity: Binding<CGSize>,
        isDragging: Binding<Bool>
    ) -> some View {
        modifier(CharcoalToastDraggableModifier(
            screenEdge: screenEdge,
            isPresenting: isPresenting,
            offset: offset,
            dragVelocity: dragVelocity,
            isDragging: isDragging
        ))
    }
}
