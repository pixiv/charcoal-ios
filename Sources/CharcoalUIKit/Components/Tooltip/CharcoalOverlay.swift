import UIKit

/**
    Displays a overlay on the screen.
 */
public class CharcoalOverlayView: UIView {
    /// The window to display the spinner in.
    var mainView: UIView!
    /// The background view of the spinner.
    var backgroundView: UIView?
    /// The container view of the spinner.
    var containerView: UIView?

    static let shared = CharcoalOverlayView()
}

// MARK: - Window

extension CharcoalOverlayView {
    /// Initializes the spinner with the given window.
    func setupView(view: UIView?) {
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

extension CharcoalOverlayView {
    private func removeBackground() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }

    private func setupBackground(_ interactionPassthrough: Bool) {
        if backgroundView == nil {
            let bounds = mainView.bounds
            backgroundView = UIView(frame: bounds)

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

        backgroundView?.isUserInteractionEnabled = interactionPassthrough ? false : true
    }
}

// MARK: - Container

extension CharcoalOverlayView {
    private func removeContainer() {
        containerView?.removeFromSuperview()
        containerView = nil
    }

    private func setupContainer(subview: UIView, transparentBackground: Bool = false) {
        if containerView == nil {
            containerView = UIView()
            containerView?.alpha = 0
            guard let containerView = containerView else {
                fatalError("Container view is nil.")
            }

            containerView.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(containerView)

            let constraints: [NSLayoutConstraint] = [
                containerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0),
                containerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0)
            ]

            NSLayoutConstraint.activate(constraints)
        }
    }
}

