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
    static func show(
        text: String,
        maxWidth: CGFloat = 312,
        appearance: CharcoalToastAppearance = .success,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat = 120,
        actionCallback: ActionCallback? = nil,
        on: UIView? = nil
    ) -> CharcoalIdentifiableOverlayView.IDValue {
        let toastView = CharcoalToastView(text: text, maxWidth: maxWidth, appearance: appearance, actionCallback: {})

        toastView.translatesAutoresizingMaskIntoConstraints = false

        let containerView = ChacoalOverlayManager.shared.layout(view: toastView, interactionMode: .passThrough, on: on)
        containerView.alpha = 1
        containerView.delegate = ChacoalOverlayManager.shared

        let toastID = containerView.id

        toastView.actionCallback = {
            actionCallback?()
            CharcoalToast.dismiss(id: toastID)
        }

        var constraints = [
            toastView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ]

        var screenEdgeSpacingConstraint: NSLayoutConstraint

        switch screenEdge {
        case .top:
            screenEdgeSpacingConstraint = toastView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -screenEdgeSpacing * screenEdge.direction)
        case .bottom:
            screenEdgeSpacingConstraint = toastView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -screenEdgeSpacing * screenEdge.direction)
        }

        constraints.append(screenEdgeSpacingConstraint)

        NSLayoutConstraint.activate(constraints)

        containerView.layoutIfNeeded()

        containerView.showAction = { [weak containerView] actionCallback in
            screenEdgeSpacingConstraint.constant = screenEdgeSpacingConstraint.constant * -1
            UIView.animate(
                withDuration: 0.65,
                delay: 0,
                usingSpringWithDamping: 0.75,
                initialSpringVelocity: 0.0,
                options: [],
                animations: {
                    containerView?.layoutIfNeeded()
                }
            ) { completion in
                actionCallback?(completion)
            }
        }

        containerView.dismissAction = { [weak containerView] actionCallback in
            screenEdgeSpacingConstraint.constant = screenEdgeSpacingConstraint.constant * -1
            UIView.animate(withDuration: 0.3, animations: {
                containerView?.layoutIfNeeded()
            }) { completion in
                containerView?.alpha = 0
                actionCallback?(completion)
            }
        }

        ChacoalOverlayManager.shared.display(view: containerView)

        return toastID
    }

    /// Dismisses the toast with the given identifier.
    static func dismiss(id: CharcoalIdentifiableOverlayView.IDValue) {
        ChacoalOverlayManager.shared.dismiss(id: id)
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

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        ChacoalOverlayManager.shared.dismiss()
    }

    return view
}
