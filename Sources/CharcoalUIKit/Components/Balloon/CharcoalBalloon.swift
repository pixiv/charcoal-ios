import UIKit

public class CharcoalBalloon {}

public extension CharcoalBalloon {
    /**
        Show a balloon anchored to a view.

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
        let tooltip = CharcoalBalloonView(text: text, targetPoint: .zero)

        tooltip.translatesAutoresizingMaskIntoConstraints = false

        let viewSize = tooltip.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        let containerView = ChacoalOverlayManager.shared.layout(view: tooltip, interactionMode: .passThrough, on: on)
     
        let mainView = ChacoalOverlayManager.shared.mainView!
        let spacingToScreen: CGFloat = 16
        let gap: CGFloat = 4
        let anchorPoint = anchorView.superview!.convert(anchorView.frame.origin, to: containerView)
        let targetPoint = anchorView.superview!.convert(anchorView.center, to: tooltip)
        let newAnchorRect = CGRect(x: anchorPoint.x, y: anchorPoint.y, width: anchorView.frame.width, height: anchorView.frame.height)

        let layoutPosition = positionOfOverlay(targetFrame: newAnchorRect, tooltipSize: viewSize, canvasGeometrySize: mainView.frame.size, spacingToScreen: spacingToScreen, arrowHeight: tooltip.arrowHeight, spacingToTarget: gap)
        
        let viewLeadingConstant = layoutPosition.width

        let viewTopConstant = layoutPosition.height

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
        let layoutPlan = priorities.filter({ $0.spaceArea.width >= tooltipSize.width && $0.spaceArea.height >= tooltipSize.height }).sorted(by: { $0.priority.order < $1.priority.order }).first ?? priorities.sorted(by: { $0.rect.intersectionArea(tooltipRect) > $1.rect.intersectionArea(tooltipRect)}).first!
        
        print("layoutPlan.priority \(layoutPlan.priority) \(tooltipSize)")
        
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
