import UIKit

public class CharcoalSnackBar {}

public extension CharcoalSnackBar {
    /**
     Show a snackbar.

     - Parameters:
     - text: The text to be displayed in the snackbar.
     - maxWidth: The maximum width of the snackbar.
     - thumbnailImage: The thumbnail image to be displayed in the snackbar.
     - screenEdge: The edge of the screen where the snackbar will be displayed.
     - screenEdgeSpacing: The spacing between the snackbar and the screen edge.
     - on: The view on which the snackbar will be displayed.

     # Example #
     ```swift
     CharcoalSnackBar.show(text: "Hello")
     ```
     */
    @discardableResult
    static func show(
        text: String,
        maxWidth: CGFloat = 312,
        thumbnailImage: UIImage? = nil,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat = 120,
        action: CharcoalAction? = nil,
        on: UIView? = nil
    ) -> CharcoalIdentifiableOverlayView.IDValue {
        let snackbarView = CharcoalSnackBarView(text: text, thumbnailImage: thumbnailImage, maxWidth: maxWidth, action: action)
        snackbarView.isUserInteractionEnabled = true
        snackbarView.translatesAutoresizingMaskIntoConstraints = false

        let containerView = ChacoalOverlayManager.shared.layout(view: snackbarView, interactionMode: .passThrough, on: on)
        containerView.alpha = 1
        containerView.isUserInteractionEnabled = false
        containerView.delegate = ChacoalOverlayManager.shared
        let containerID = containerView.id

        snackbarView.setupGestureAnimator(screenEdge, gestureDismissCallback: {
            ChacoalOverlayManager.shared.dismiss(id: containerID)
        })

        var constraints = [
            snackbarView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ]

        var screenEdgeSpacingConstraint: NSLayoutConstraint

        switch screenEdge {
        case .top:
            screenEdgeSpacingConstraint = snackbarView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -screenEdgeSpacing * screenEdge.direction)
        case .bottom:
            screenEdgeSpacingConstraint = snackbarView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -screenEdgeSpacing * screenEdge.direction)
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

        return containerView.id
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

    CharcoalSnackBar.show(text: "Hello World", screenEdge: .top)
    CharcoalSnackBar.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", screenEdge: .top, screenEdgeSpacing: 220)
    CharcoalSnackBar.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", thumbnailImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64), screenEdge: .bottom, action: CharcoalAction(title: "編集", actionCallback: {
        print("Tapped 編集")
    }))

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        ChacoalOverlayManager.shared.dismiss()
    }

    return view
}
