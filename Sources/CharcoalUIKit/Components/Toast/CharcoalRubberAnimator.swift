import UIKit

class CharcoalRubberAnimator: NSObject {
    let screenEdge: CharcoalPopupViewEdge

    var dragVelocity: CGPoint = .zero

    var isDragging: Bool = false

    var offset: CGSize = .zero

    var dismiss: (() -> Void)?

    init(screenEdge: CharcoalPopupViewEdge) {
        self.screenEdge = screenEdge
        super.init()
    }

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }

        let translation = gesture.translation(in: gesture.view)
        let velocity = gesture.velocity(in: gesture.view)
        let translationInDirection = translation.y * screenEdge.direction
        let movingVelocityInDirection = velocity.y * screenEdge.direction
        let offsetInDirection = offset.height * screenEdge.direction

        // Rubber band effect
        let damping: CGFloat = 0.75
        let initialSpringVelocity: CGFloat = 0.0
        let duration: TimeInterval = 0.65

        switch gesture.state {
        case .began:
            isDragging = true
        case .changed:
            dragVelocity = velocity
            if translationInDirection < 0 {
                offset = CGSize(width: 0, height: translation.y)
                view.transform = CGAffineTransform(translationX: 0, y: translation.y)
            } else {
                let limit: CGFloat = 60
                let dist = sqrt(translation.y * translation.y)
                let factor = 1 / (dist / limit + 1)
                offset = CGSize(width: 0, height: translation.y * factor)
                view.transform = CGAffineTransform(translationX: 0, y: translation.y * factor)
            }
        case .ended, .cancelled:
            isDragging = false
            if offsetInDirection < -50 || movingVelocityInDirection < -100 {
                // Dismiss
                dismiss?()
            } else {
                UIView.animate(
                    withDuration: duration,
                    delay: 0,
                    usingSpringWithDamping: damping,
                    initialSpringVelocity: initialSpringVelocity,
                    options: [],
                    animations: {
                        view.transform = .identity
                    },
                    completion: nil
                )
            }
        default:
            break
        }
    }

    deinit {
        print("CharcoalRubberAnimator deinit")
    }
}
