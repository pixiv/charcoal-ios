import UIKit

/**
 Displays a overlay on the screen.
 */
class ChacoalOverlayManager: UIView {
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
        guard backgroundView == nil else {
            return
        }

        let backgroundView = UIView(frame: .zero)
        backgroundView.isUserInteractionEnabled = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(backgroundView)

        let constraints: [NSLayoutConstraint] = [
            backgroundView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
            backgroundView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
            backgroundView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0)
        ]

        NSLayoutConstraint.activate(constraints)

        self.backgroundView = backgroundView
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
    func layout(
        view: UIView,
        transparentBackground: Bool = false,
        interactionMode: CharcoalOverlayInteractionMode = .dimissOnTouch,
        on superView: UIView? = nil
    ) -> CharcoalIdentifiableOverlayView {
        setupSuperView(view: superView)
        setupBackground()
        let containerView = setupContainer(interactionMode)
        containerView.addSubview(view)
        return containerView
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

// MARK: - CharcoalIdentifiableOverlayDelegate

extension ChacoalOverlayManager: CharcoalIdentifiableOverlayDelegate {
    func overlayViewDidDismiss(_ overlayID: CharcoalIdentifiableOverlayView.ID) {
        overlayContainerViews = overlayContainerViews.filter { $0.id != overlayID }
        if overlayContainerViews.isEmpty {
            removeBackground()
        }
    }
}
