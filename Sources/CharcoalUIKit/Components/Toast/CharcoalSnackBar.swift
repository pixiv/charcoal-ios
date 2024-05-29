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
        let toastView = CharcoalSnackBarView(text: text, thumbnailImage: thumbnailImage, maxWidth: maxWidth, action: action)
        toastView.isUserInteractionEnabled = true
        toastView.translatesAutoresizingMaskIntoConstraints = false

        let containerView = ChacoalOverlayManager.shared.layout(view: toastView, interactionMode: .passThrough, on: on)
        containerView.alpha = 1
        containerView.isUserInteractionEnabled = false

        let rubberGesture = CharcoalRubberGesture(screenEdge: screenEdge)
        toastView.addGesture(rubberGesture)
        rubberGesture.dismiss = {
            ChacoalOverlayManager.shared.dismiss(id: containerView.id)
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

        containerView.showAction = { actionCallback in
            screenEdgeSpacingConstraint.constant = screenEdgeSpacingConstraint.constant * -1
            UIView.animate(
                withDuration: 0.65,
                delay: 0,
                usingSpringWithDamping: 0.75,
                initialSpringVelocity: 0.0,
                options: [],
                animations: {
                    containerView.layoutIfNeeded()
                }
            ) { completion in
                actionCallback?(completion)
            }
        }

        containerView.dismissAction = { actionCallback in
            screenEdgeSpacingConstraint.constant = screenEdgeSpacingConstraint.constant * -1
            UIView.animate(withDuration: 0.3, animations: {
                containerView.layoutIfNeeded()
            }) { completion in
                containerView.alpha = 0
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

    DispatchQueue.main.async {
        CharcoalSnackBar.show(text: "Hello World", screenEdge: .top)
        CharcoalSnackBar.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", screenEdge: .top, screenEdgeSpacing: 220)
        CharcoalSnackBar.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", thumbnailImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64), screenEdge: .bottom, action: CharcoalAction(title: "編集", actionCallback: {
            print("Tapped 編集")
        }))
    }

//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//        ChacoalOverlayManager.shared.dismiss()
//    }

    return view
}
