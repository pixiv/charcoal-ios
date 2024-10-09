import UIKit

public class CharcoalBalloon {}

public extension CharcoalBalloon {
    /**
    Show a balloon anchored to a view.

    - Parameters:
      - text: The text to be displayed in the tooltip.
      - anchorView: The view to which the tooltip will be anchored.
      - interactionMode: The interaction mode of the tooltip. The default value is `.passThrough`.
      - spacingToScreen: The spacing between the tooltip and the screen. The default value is `16`.
      - gap: The spacing between the tooltip and the anchor view. The default value is `4`.
      - on: The view on which the tooltip will be displayed. If not provided, the tooltip will be displayed on the window.
 
    - Returns: The identifier of the tooltip.
 
    # Example
    ```swift
    CharcoalTooltip.show(text: "This is a tooltip", anchorView: someView)
    ```
     */
    @discardableResult
    static func show(
        text: String,
        anchorView: UIView,
        interactionMode: CharcoalOverlayInteractionMode = .passThrough,
        spacingToScreen: CGFloat = 16,
        gap: CGFloat = 4,
        on: UIView? = nil
    ) -> CharcoalIdentifiableOverlayView.IDValue {
        let tooltip = CharcoalBalloonView(text: text, targetPoint: .zero)

        tooltip.translatesAutoresizingMaskIntoConstraints = false

        let tooltipViewSize = tooltip.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        let containerView = ChacoalOverlayManager.shared.layout(view: tooltip, interactionMode: interactionMode, on: on)
        containerView.delegate = ChacoalOverlayManager.shared
        let mainView = ChacoalOverlayManager.shared.mainView!

        // viewLeadingConstraint and topLeadingConstraint are used to update the tooltip position
        let viewLeadingConstraint = tooltip.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)

        let topLeadingConstraint = tooltip.topAnchor.constraint(equalTo: containerView.topAnchor)

        let constraints: [NSLayoutConstraint] = [
            viewLeadingConstraint,
            topLeadingConstraint
        ]
        NSLayoutConstraint.activate(constraints)

        updateConstraint(anchorView: anchorView, containerView: containerView, tooltip: tooltip, mainView: mainView, gap: gap, spacingToScreen: spacingToScreen, tooltipViewSize: tooltipViewSize, viewLeadingConstraint: viewLeadingConstraint, topLeadingConstraint: topLeadingConstraint)

        containerView.showAction = { [weak containerView] actionCallback in
            UIView.animate(withDuration: 0.25, animations: {
                containerView?.alpha = 1
            }) { completion in
                actionCallback?(completion)
            }
        }

        // If the interaction mode is passThrough, we need to add a tracking view to update the tooltip position
        var anchorPointView: CharcoalAnchorTrackingView?

        if interactionMode == .passThrough {
            anchorPointView = CharcoalAnchorTrackingView(frame: .zero)

            if let anchorPointView {
                anchorPointView.translatesAutoresizingMaskIntoConstraints = false

                anchorView.addSubview(anchorPointView)

                anchorPointView.locationDidUpdated = { [
                    weak viewLeadingConstraint,
                    weak topLeadingConstraint,
                    weak tooltip,
                    weak mainView
                ] anchorView in
                    if let anchorView,
                       let tooltip,
                       let viewLeadingConstraint,
                       let topLeadingConstraint,
                       let mainView
                    {
                        updateConstraint(anchorView: anchorView, containerView: containerView, tooltip: tooltip, mainView: mainView, gap: gap, spacingToScreen: spacingToScreen, tooltipViewSize: tooltipViewSize, viewLeadingConstraint: viewLeadingConstraint, topLeadingConstraint: topLeadingConstraint)
                    }
                }
            }
        }

        containerView.dismissAction = { [weak containerView, weak anchorPointView] actionCallback in
            UIView.animate(withDuration: 0.25, animations: {
                containerView?.alpha = 0
                anchorPointView?.tearDown()
            }) { completion in
                actionCallback?(completion)
            }
        }

        tooltip.closeAction = { [weak containerView] in
            containerView?.dismiss()
        }

        ChacoalOverlayManager.shared.display(view: containerView)

        return containerView.id
    }

    private static func updateConstraint(anchorView: UIView, containerView: UIView, tooltip: CharcoalBalloonView, mainView: UIView, gap: CGFloat, spacingToScreen: CGFloat, tooltipViewSize: CGSize, viewLeadingConstraint: NSLayoutConstraint, topLeadingConstraint: NSLayoutConstraint) {
        guard let anchorViewSuperView = anchorView.superview else {
            return
        }
        let anchorPoint = anchorViewSuperView.convert(anchorView.frame.origin, to: containerView)
        let targetPoint = anchorViewSuperView.convert(anchorView.center, to: tooltip)
        let newAnchorRect = CGRect(x: anchorPoint.x, y: anchorPoint.y, width: anchorView.frame.width, height: anchorView.frame.height)

        let layoutPosition = positionOfOverlay(targetFrame: newAnchorRect, tooltipSize: tooltipViewSize, canvasGeometrySize: mainView.frame.size, spacingToScreen: spacingToScreen, arrowHeight: tooltip.arrowHeight, spacingToTarget: gap)

        let viewLeadingConstant = layoutPosition.width

        let viewTopConstant = layoutPosition.height

        viewLeadingConstraint.constant = viewLeadingConstant

        topLeadingConstraint.constant = viewTopConstant

        let newTargetPoint = CGPoint(x: targetPoint.x - viewLeadingConstant, y: targetPoint.y - viewTopConstant)

        tooltip.updateTargetPoint(point: newTargetPoint)
    }

    /// Dismisses the tooltip with the given identifier.
    static func dismiss(id: CharcoalIdentifiableOverlayView.IDValue) {
        ChacoalOverlayManager.shared.dismiss(id: id)
    }

    /// Calculate the position of the tooltip
    static func positionOfOverlay(targetFrame: CGRect, tooltipSize: CGSize, canvasGeometrySize: CGSize, spacingToScreen: CGFloat, arrowHeight: CGFloat, spacingToTarget: CGFloat) -> CGSize {
        // Check avaliable area for each direction, compare area size with tooltip size.
        // The priorty is Bottom > Top > Right > Left
        var priorities: [LayoutPriority] = []

        // Calculate layout it by sides
        let rightWidth = canvasGeometrySize.width - targetFrame.maxX - spacingToScreen - arrowHeight
        let rightHeight = canvasGeometrySize.height - targetFrame.height
        priorities.append(LayoutPriority(priority: .right, spaceArea: CGSize(width: rightWidth, height: rightHeight)))

        let leftWidth = targetFrame.minX - spacingToScreen - arrowHeight
        let leftHeight = canvasGeometrySize.height - targetFrame.height
        priorities.append(LayoutPriority(priority: .left, spaceArea: CGSize(width: leftWidth, height: leftHeight)))

        // Calculate layout it by top and bottom
        let bottomHeight = canvasGeometrySize.height - targetFrame.maxY - spacingToScreen - spacingToTarget - arrowHeight
        let buttonWidth = canvasGeometrySize.width - spacingToScreen * 2
        priorities.append(LayoutPriority(priority: .bottom, spaceArea: CGSize(width: buttonWidth, height: bottomHeight)))

        let topHeight = targetFrame.minY - spacingToScreen - arrowHeight - spacingToTarget
        let topWidth = canvasGeometrySize.width - spacingToScreen * 2
        priorities.append(LayoutPriority(priority: .top, spaceArea: CGSize(width: topWidth, height: topHeight)))

        let tooltipRect = CGRect(x: 0, y: 0, width: tooltipSize.width, height: tooltipSize.height)

        // Get the ideal layout plan
        let layoutPlan = priorities.filter { $0.spaceArea.width >= tooltipSize.width && $0.spaceArea.height >= tooltipSize.height }.sorted(by: { $0.priority.order < $1.priority.order }).first ?? priorities.sorted(by: { $0.rect.intersectionArea(tooltipRect) > $1.rect.intersectionArea(tooltipRect) }).first!

//        print("layoutPlan.priority \(layoutPlan.priority) \(tooltipSize)")

        switch layoutPlan.priority {
        case .bottom:
            return CGSize(width: tooltipX(anchorFrame: targetFrame, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometrySize, spacingToScreen: spacingToScreen), height: targetFrame.maxY + spacingToTarget + arrowHeight)
        case .top:
            return CGSize(width: tooltipX(anchorFrame: targetFrame, tooltipSize: tooltipSize, canvasGeometrySize: canvasGeometrySize, spacingToScreen: spacingToScreen), height: targetFrame.minY - spacingToTarget - tooltipSize.height - arrowHeight)
        case .right:
            return CGSize(width: targetFrame.maxX + spacingToTarget + arrowHeight, height: targetFrame.midY - tooltipSize.height / 2.0)
        case .left:
            return CGSize(width: targetFrame.minX - tooltipSize.width - spacingToTarget - arrowHeight, height: targetFrame.midY - tooltipSize.height / 2.0)
        }
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
        CharcoalBalloon.show(text: "Hello World This is a tooltip", anchorView: button2)
        CharcoalBalloon.show(text: "Hello World", anchorView: button)
        CharcoalBalloon.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", anchorView: button3)
    }

    return view
}
