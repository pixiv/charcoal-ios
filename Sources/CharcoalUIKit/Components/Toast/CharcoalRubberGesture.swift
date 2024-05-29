import UIKit

protocol CharcoalGesture {
    var gesture: UIGestureRecognizer { get }
}

class CharcoalRubberGesture: NSObject, CharcoalGesture {
    var gesture: UIGestureRecognizer
    
    override init() {
        self.gesture = UIPanGestureRecognizer()
        super.init()
        gesture.addTarget(self, action: #selector(handlePan(_:)))
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        print("Pan")
        guard let view = gesture.view else { return }
        
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        switch gesture.state {
        case .began, .changed:
            view.transform = CGAffineTransform(translationX: 0, y: translation.y)
        case .ended:
            let damping: CGFloat = 0.75
            let initialSpringVelocity: CGFloat = 0.0
            let duration: TimeInterval = 0.65
            let completion: ((Bool) -> Void)? = nil
            
            let isDismissing = velocity.y > 0
            
            if isDismissing {
                UIView.animate(
                    withDuration: duration,
                    delay: 0,
                    usingSpringWithDamping: damping,
                    initialSpringVelocity: initialSpringVelocity,
                    options: [],
                    animations: {
                        view.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
                    },
                    completion: completion
                )
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
                    completion: completion
                )
            }
        default:
            break
        }
    }
}
