import UIKit

public class CharcoalToast {}

public extension CharcoalToast {
    /**
        Show a toast.

     - Parameters:
        - text: The text to be displayed in the toast.
        - maxWidth: The maximum width of the toast.
        - appearance: The appearance of the toast.
        - screenEdge: The edge of the screen where the toast will be displayed.
        - screenEdgeSpacing: The spacing between the toast and the screen edge.
        - on: The view on which the toast will be displayed.

     # Example #
     ```swift
     CharcoalToast.show(text: "This is a toast")
     ```
     */
    @discardableResult
    static func show(text: String,
                     maxWidth: CGFloat = 312,
                     appearance: CharcoalToastAppearance = .success,
                     screenEdge: CharcoalPopupViewEdge = .bottom,
                     screenEdgeSpacing: CGFloat = 120,
                     on: UIView? = nil) -> CharcoalIdentifiableOverlayView.IDValue {
        let toastView = CharcoalToastView(text: text, maxWidth: maxWidth, appearance: appearance)

        toastView.translatesAutoresizingMaskIntoConstraints = false

        let containerView = ChacoalOverlayManager.shared.layout(view: toastView, interactionMode: .passThrough, on: on)
        
        var constraints = [
            toastView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ]
        
        switch screenEdge {
        case .top:
            
        case .bottom:
            
        }
        
        NSLayoutConstraint.activate(constraints)
        
        containerView.showAction = { actionCallback in
            UIView.animate(withDuration: 0.25, animations: {
                containerView.alpha = 1
            }) { completion in
                actionCallback?(completion)
            }
        }
        
        containerView.dismissAction = { actionCallback in
            UIView.animate(withDuration: 0.25, animations: {
                containerView.alpha = 0
            }) { completion in
                actionCallback?(completion)
            }
        }
        
        ChacoalOverlayManager.shared.display(view: containerView)

        return containerView.id
    }
}

@available(iOS 17.0, *)
#Preview() {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray

    DispatchQueue.main.async {
        CharcoalToast.show(text: "Hello World", appearance: .success, screenEdge: .top)
        CharcoalToast.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", appearance: .error, screenEdge: .bottom)
    }

    return view
}