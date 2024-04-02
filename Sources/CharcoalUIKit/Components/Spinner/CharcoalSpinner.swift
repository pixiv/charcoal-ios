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

    private func setupContainer(spinnerSize: CGFloat) {
        if (containerView == nil) {
            let padding = CGFloat(16)
            containerView = UIView(frame: CGRect.zero)
            guard let containerView = containerView else {
                fatalError("Container view is nil.")
            }
            
            containerView.backgroundColor = UIColor.white
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowRadius = 8
            containerView.layer.cornerRadius = 8
            containerView.layer.shadowOpacity = 0.1
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            mainWindow.addSubview(containerView)
            
            var constraints: [NSLayoutConstraint] = []
            
            constraints = [
                containerView.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor, constant: 0),
                containerView.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor, constant: 0),
                containerView.widthAnchor.constraint(equalToConstant: spinnerSize + padding),
                containerView.heightAnchor.constraint(equalToConstant: spinnerSize + padding)
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
    }
}

// MARK: - Spinner View
extension CharcoalSpinner {
    private func removeSpinnerView() {
    }

    private func setupSpinnerView(spinnerSize: CGFloat) {
        let spinner = CharcoalSpinnerView(spinnerSize: spinnerSize)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        containerView!.addSubview(spinner)
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints = [
            spinner.centerXAnchor.constraint(equalTo: containerView!.centerXAnchor, constant: 0),
            spinner.centerYAnchor.constraint(equalTo: containerView!.centerYAnchor, constant: 0),
            spinner.widthAnchor.constraint(equalToConstant: spinnerSize),
            spinner.heightAnchor.constraint(equalToConstant: spinnerSize)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - Spinner, Show, Dismiss
extension CharcoalSpinner {
    func show(spinnerSize: CGFloat = 48, dismissOnTouch: Bool, onWindow window: UIWindow? = nil) {
        setupWindow(window: window)
        setupBackground(dismissOnTouch)
        setupContainer(spinnerSize: spinnerSize)
        setupSpinnerView(spinnerSize: spinnerSize)
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
