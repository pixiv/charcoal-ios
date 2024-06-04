import UIKit

public class CharcoalTooltip {}

public extension CharcoalTooltip {
    /**
        Show a tooltip anchored to a view.

     - Parameters:
        - text: The text to be displayed in the tooltip.
        - anchorView: The view to which the tooltip will be anchored.
        - on: The view on which the tooltip will be displayed. If not provided, the tooltip will be displayed on the window.

     # Example #
     ```swift
     CharcoalTooltip.show(text: "This is a tooltip", anchorView: someView)
     ```
     */
    @discardableResult
    static func show(text: String, anchorView: UIView, on: UIView? = nil) -> CharcoalIdentifiableOverlayView.IDValue {
        let tooltip = CharcoalTooltipView(text: text, targetPoint: .zero)

        tooltip.translatesAutoresizingMaskIntoConstraints = false

        let containerView = ChacoalOverlayManager.shared.layout(view: tooltip, interactionMode: .dimissOnTouch, on: on)

        let mainView = ChacoalOverlayManager.shared.mainView!
        let spacingToScreen: CGFloat = 16
        let gap: CGFloat = 4
        let viewSize = tooltip.intrinsicContentSize

        let anchorPoint = anchorView.superview!.convert(anchorView.frame.origin, to: containerView)
        let targetPoint = anchorView.superview!.convert(anchorView.center, to: tooltip)
        let newAnchorRect = CGRect(x: anchorPoint.x, y: anchorPoint.y, width: anchorView.frame.width, height: anchorView.frame.height)

        let viewLeadingConstant = tooltipX(anchorFrame: newAnchorRect, tooltipSize: viewSize, canvasGeometrySize: mainView.frame.size, spacingToScreen: spacingToScreen)

        let viewTopConstant = tooltipY(anchorFrame: newAnchorRect, arrowHeight: tooltip.arrowHeight, tooltipSize: viewSize, canvasGeometrySize: mainView.frame.size, spacingToTarget: gap)

        let newTargetPoint = CGPoint(x: targetPoint.x - viewLeadingConstant, y: targetPoint.y - viewTopConstant)
        tooltip.updateTargetPoint(point: newTargetPoint)

        let constraints: [NSLayoutConstraint] = [
            tooltip.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: viewLeadingConstant),
            tooltip.topAnchor.constraint(equalTo: containerView.topAnchor, constant: viewTopConstant)
        ]
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

    /// Dismisses the tooltip with the given identifier.
    static func dismiss(id: CharcoalIdentifiableOverlayView.IDValue) {
        ChacoalOverlayManager.shared.dismiss(id: id)
    }

    static func tooltipX(anchorFrame: CGRect, tooltipSize: CGSize, canvasGeometrySize: CGSize, spacingToScreen: CGFloat) -> CGFloat {
        let minX = anchorFrame.midX - (tooltipSize.width / 2.0)

        var edgeLeft = minX

        if edgeLeft + tooltipSize.width >= canvasGeometrySize.width {
            edgeLeft = canvasGeometrySize.width - tooltipSize.width - spacingToScreen
        } else if edgeLeft < spacingToScreen {
            edgeLeft = spacingToScreen
        }

        return edgeLeft
    }

    static func tooltipY(anchorFrame: CGRect, arrowHeight: CGFloat, tooltipSize: CGSize, canvasGeometrySize: CGSize, spacingToTarget: CGFloat) -> CGFloat {
        let minX = anchorFrame.maxY + spacingToTarget + arrowHeight
        var edgeBottom = anchorFrame.maxY + spacingToTarget + anchorFrame.height
        if edgeBottom + tooltipSize.height >= canvasGeometrySize.height {
            edgeBottom = anchorFrame.minY - tooltipSize.height - spacingToTarget - arrowHeight
        }

        return min(minX, edgeBottom)
    }
}

@available(iOS 17.0, *)
#Preview() {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray

    let button = CharcoalPrimaryMButton()
    button.setTitle("OK", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)

    NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])

    let button2 = CharcoalPrimaryMButton()
    button2.setTitle("OK", for: .normal)
    button2.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button2)

    NSLayoutConstraint.activate([
        button2.topAnchor.constraint(equalTo: view.topAnchor),
        button2.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])

    let button3 = CharcoalPrimaryMButton()
    button3.setTitle("OK", for: .normal)
    button3.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button3)

    NSLayoutConstraint.activate([
        button3.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        button3.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    DispatchQueue.main.async {
        CharcoalTooltip.show(text: "Hello World", anchorView: button)

        CharcoalTooltip.show(text: "Hello World This is a tooltip", anchorView: button2)

        CharcoalTooltip.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", anchorView: button3)
    }

    return view
}
