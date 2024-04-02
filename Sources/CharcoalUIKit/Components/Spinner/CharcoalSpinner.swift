import UIKit

public class CharcoalSpinner: UIView {
    /// The window to display the spinner in.
    var mainWindow: UIWindow!
    /// The background view of the spinner.
    var backgroundView: UIView?
    /// The container view of the spinner.
    var containerView: UIView?
}

// MARK: - Window
extension CharcoalSpinner {
    /// Initializes the spinner with the given window.
    func setupWindow(window: UIWindow?) {
        if let window = window {
            mainWindow = window
        } else {
            if (mainWindow == nil) {
                let scene = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
                                    .filter { $0.activationState == .foregroundActive }
                                    .first
                mainWindow = scene?.windows.filter { $0.isKeyWindow }.first ?? UIApplication.shared.windows.first
            }
        }
    }
}

// MARK: - Background
extension CharcoalSpinner {
    private func removeBackground() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }

    private func setupBackground(_ interaction: Bool) {
        if (backgroundView == nil) {
            let bounds = mainWindow.bounds
            backgroundView = UIView(frame: bounds)
            
            guard let backgroundView = backgroundView else {
                fatalError("Background view is nil.")
            }
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            mainWindow.addSubview(backgroundView)
            
            var constraints: [NSLayoutConstraint] = []
            
            constraints = [
                backgroundView.leadingAnchor.constraint(equalTo: mainWindow.leadingAnchor, constant: 0),
                backgroundView.topAnchor.constraint(equalTo: mainWindow.topAnchor, constant: 0),
                backgroundView.bottomAnchor.constraint(equalTo: mainWindow.bottomAnchor, constant: 0),
                backgroundView.rightAnchor.constraint(equalTo: mainWindow.rightAnchor, constant: 0)
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
        
        backgroundView?.isUserInteractionEnabled = !interaction
    }
}

// MARK: - Container
extension CharcoalSpinner {
    private func removeContainer() {
    }

    private func setupContainer(subview: UIView) {
        if (containerView == nil) {
            containerView = SpinnerContainerView(subview: subview)
            guard let containerView = containerView else {
                fatalError("Container view is nil.")
            }
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            mainWindow.addSubview(containerView)
            
            var constraints: [NSLayoutConstraint] = []
            
            constraints = [
                containerView.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor, constant: 0),
                containerView.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor, constant: 0)
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
    }
}

// MARK: - Spinner, Show, Dismiss
extension CharcoalSpinner {
    func show(spinnerSize: CGFloat = 48, dismissOnTouch: Bool, onWindow window: UIWindow? = nil) {
        setupWindow(window: window)
        setupBackground(dismissOnTouch)
        setupContainer(subview: CharcoalSpinnerView(spinnerSize: spinnerSize))
        display()
    }
    
    func dismiss() {
        
    }
    
    func display() {
        if (alpha == 0) {
            alpha = 1
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let spinner = CharcoalSpinner()
    spinner.show(dismissOnTouch: false)
    return spinner
}
