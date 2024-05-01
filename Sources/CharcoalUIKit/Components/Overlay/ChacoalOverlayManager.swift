import UIKit

enum CharcoalOverlayInteractionMode {
    case passThrough
    case block
    case dimissOnTap
}

/**
 Displays a overlay on the screen.
 */
public class ChacoalOverlayManager: UIView {
    /// The window to display the overlays in.
    var mainView: UIView!
    /// The background view of the overlays.
    var backgroundView: UIView?
    /// The container view array of the overlays.
    var overlayContainerViews: [CharcoalIdentifiableOverlayView] = []
    /// Shared instance of the overlay manager.
    static let shared = ChacoalOverlayManager()
}

// MARK: - Window

extension ChacoalOverlayManager {
    /// Initializes the spinner with the given window.
    func setupSuperView(view: UIView?) {
        if let view = view {
            mainView = view
        } else {
            if mainView == nil {
                let scene = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
                    .filter { $0.activationState == .foregroundActive }
                    .first
                mainView = scene?.windows.filter { $0.isKeyWindow }.first ??
                    UIApplication.shared.windows.first
            }
        }
    }
}

// MARK: - Background

extension ChacoalOverlayManager {
    private func removeBackground() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }

    private func setupBackground() {
        if backgroundView == nil {
            backgroundView = UIView(frame: .zero)
            backgroundView?.isUserInteractionEnabled = false
            guard let backgroundView = backgroundView else {
                fatalError("Background view is nil.")
            }

            backgroundView.translatesAutoresizingMaskIntoConstraints = false

            mainView.addSubview(backgroundView)

            let constraints: [NSLayoutConstraint] = [
                backgroundView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
                backgroundView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
                backgroundView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
                backgroundView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0)
            ]

            NSLayoutConstraint.activate(constraints)
        }
    }
}

// MARK: - Container

extension ChacoalOverlayManager {
    private func setupContainer(_ interactionMode: CharcoalOverlayInteractionMode) -> CharcoalIdentifiableOverlayView {
        let containerView = CharcoalIdentifiableOverlayView(interactionMode: interactionMode)
        containerView.alpha = 0
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(containerView)
        overlayContainerViews.append(containerView)
        let constraints: [NSLayoutConstraint] = [
            containerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: mainView.topAnchor),
            containerView.heightAnchor.constraint(equalTo: mainView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: mainView.widthAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        return containerView
    }
}

// MARK: - Show, Dismiss

extension ChacoalOverlayManager {
    @discardableResult
    func show(
        view: UIView,
        transparentBackground: Bool = false,
        interactionMode: CharcoalOverlayInteractionMode = .dimissOnTap,
        anchorView: UIView? = nil,
        on superView: UIView? = nil
    ) -> CharcoalIdentifiableOverlayView.IDValue {
        setupSuperView(view: superView)
        setupBackground()
        let containerView = setupContainer(interactionMode)
        containerView.addSubview(view)

        if let anchorView = anchorView, let anchorableView = view as? CharcoalAnchorable {
            let spacingToScreen: CGFloat = 16
            let gap: CGFloat = 4
            let viewSize = view.intrinsicContentSize
            let anchorPoint = anchorView.superview!.convert(anchorView.frame.origin, to: containerView)
            let targetPoint = anchorView.superview!.convert(anchorView.center, to: view)
            let newAnchorRect = CGRect(x: anchorPoint.x, y: anchorPoint.y, width: anchorView.frame.width, height: anchorView.frame.height)

            let viewLeadingConstant = tooltipX(anchorFrame: newAnchorRect, tooltipSize: viewSize, canvasGeometrySize: mainView.frame.size, spacingToScreen: spacingToScreen)

            let viewTopConstant = tooltipY(anchorFrame: newAnchorRect, arrowHeight: anchorableView.arrowHeight, tooltipSize: viewSize, canvasGeometrySize: mainView.frame.size, spacingToTarget: gap)

            let newTargetPoint = CGPoint(x: targetPoint.x - viewLeadingConstant, y: targetPoint.y - viewTopConstant)
            anchorableView.updateTargetPoint(point: newTargetPoint)

            let constraints: [NSLayoutConstraint] = [
                view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: viewLeadingConstant),
                view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: viewTopConstant)
            ]
            NSLayoutConstraint.activate(constraints)
        }

        display(view: containerView)

        return containerView.id
    }

    func display() {
        for containerView in overlayContainerViews {
            containerView.display()
        }
    }

    @objc func dismiss() {
        for containerView in overlayContainerViews {
            containerView.dismiss()
        }
    }

    /// Displays the overlay.
    func display(view: CharcoalIdentifiableOverlayView) {
        view.display()
    }

    /// Dismisses the overlay with the given identifier.
    func dismiss(id: CharcoalIdentifiableOverlayView.IDValue) {
        let containerView = overlayContainerViews.first { $0.id == id }
        containerView?.dismiss()
    }
}

// MARK: Layout

extension ChacoalOverlayManager {
    func tooltipX(anchorFrame: CGRect, tooltipSize: CGSize, canvasGeometrySize: CGSize, spacingToScreen: CGFloat) -> CGFloat {
        let minX = anchorFrame.midX - (tooltipSize.width / 2.0)

        var edgeLeft = minX

        if edgeLeft + tooltipSize.width >= canvasGeometrySize.width {
            edgeLeft = canvasGeometrySize.width - tooltipSize.width - spacingToScreen
        } else if edgeLeft < spacingToScreen {
            edgeLeft = spacingToScreen
        }

        return edgeLeft
    }

    func tooltipY(anchorFrame: CGRect, arrowHeight: CGFloat, tooltipSize: CGSize, canvasGeometrySize: CGSize, spacingToTarget: CGFloat) -> CGFloat {
        let minX = anchorFrame.maxY + spacingToTarget + arrowHeight
        var edgeBottom = anchorFrame.maxY + spacingToTarget + anchorFrame.height
        if edgeBottom + tooltipSize.height >= canvasGeometrySize.height {
            edgeBottom = anchorFrame.minY - tooltipSize.height - spacingToTarget - arrowHeight
        }

        return min(minX, edgeBottom)
    }
}

// MARK: - CharcoalIdentifiableOverlayDelegate

extension ChacoalOverlayManager: CharcoalIdentifiableOverlayDelegate {
    func overlayViewDidDismiss(_ overlayView: CharcoalIdentifiableOverlayView) {
        overlayContainerViews = overlayContainerViews.filter { $0.id != overlayView.id }
        if overlayContainerViews.isEmpty {
            removeBackground()
        }
    }
}
