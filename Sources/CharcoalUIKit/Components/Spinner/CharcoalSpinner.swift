import UIKit

public class CharcoalSpinner: UIView {
    /// The window to display the spinner in.
    var mainWindow: UIWindow!
    /// The background view of the spinner.
    var backgroundView: UIView?
    /// The container view of the spinner.
    var containerView: UIView?
    
    static let shared = CharcoalSpinner()
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

    private func setupBackground(_ dismissOnTouch: Bool) {
        if (backgroundView == nil) {
            let bounds = mainWindow.bounds
            backgroundView = UIView(frame: bounds)
            
            guard let backgroundView = backgroundView else {
                fatalError("Background view is nil.")
            }
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            mainWindow.addSubview(backgroundView)
            
            let constraints: [NSLayoutConstraint] =  [
                backgroundView.leadingAnchor.constraint(equalTo: mainWindow.leadingAnchor, constant: 0),
                backgroundView.topAnchor.constraint(equalTo: mainWindow.topAnchor, constant: 0),
                backgroundView.bottomAnchor.constraint(equalTo: mainWindow.bottomAnchor, constant: 0),
                backgroundView.rightAnchor.constraint(equalTo: mainWindow.rightAnchor, constant: 0)
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
        
        backgroundView?.isUserInteractionEnabled = dismissOnTouch
        
        if (dismissOnTouch) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
            backgroundView?.addGestureRecognizer(tapGesture)
        }
    }
}

// MARK: - Container
extension CharcoalSpinner {
    private func removeContainer() {
        containerView?.removeFromSuperview()
        containerView = nil
    }

    private func setupContainer(subview: UIView, transparentBackground: Bool = false) {
        if (containerView == nil) {
            containerView = SpinnerContainerView(subview: subview, transparentBackground: transparentBackground)
            containerView?.alpha = 0
            guard let containerView = containerView else {
                fatalError("Container view is nil.")
            }
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            mainWindow.addSubview(containerView)
            
            let constraints: [NSLayoutConstraint] = [
                containerView.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor, constant: 0),
                containerView.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor, constant: 0)
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
    }
}

// MARK: - Spinner, Show, Dismiss
extension CharcoalSpinner {
    func show(spinnerSize: CGFloat = 48,
              transparentBackground: Bool = false,
              dismissOnTouch: Bool,
              onWindow window: UIWindow? = nil) {
        setupWindow(window: window)
        setupBackground(dismissOnTouch)
        setupContainer(subview: CharcoalSpinnerView(spinnerSize: spinnerSize), transparentBackground: transparentBackground)
        display()
    }
    
    @objc func dismiss() {
        // Hide with animation
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.containerView?.alpha = 0
        }) { [weak self] _ in
            self?.removeContainer()
            self?.removeBackground()
            self?.removeFromSuperview()
        }
    }
    
    func display() {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.containerView?.alpha = 1
        })
    }
}

// MARK: Class Show, Dismiss
public extension CharcoalSpinner {
    class func show(spinnerSize: CGFloat = 48,
              transparentBackground: Bool = false,
              dismissOnTouch: Bool = false,
              onWindow window: UIWindow? = nil) {
        DispatchQueue.main.async {
            shared.show(spinnerSize: spinnerSize, transparentBackground: transparentBackground, dismissOnTouch: dismissOnTouch, onWindow: window)
        }
    }
    
    class func dismiss() {
        DispatchQueue.main.async {
            shared.dismiss()
        }
    }
}

class CharcoalSpinnerPreview: UIView {
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8.0
        
        let button = CharcoalPrimaryMButton()
        button.addTarget(self, action: #selector(showNormalSpinner), for: .touchUpInside)
        button.setTitle("Normal", for: .normal)
        
        let transparentButton = CharcoalPrimaryMButton()
        transparentButton.addTarget(self, action: #selector(showTransparentSpinner), for: .touchUpInside)
        transparentButton.setTitle("Transparent", for: .normal)
        
        let dismissButton = CharcoalDefaultMButton()
        dismissButton.addTarget(self, action: #selector(dismissSpinner), for: .touchUpInside)
        dismissButton.setTitle("Dismiss", for: .normal)
        
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(transparentButton)
        stackView.addArrangedSubview(dismissButton)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            stackView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    @objc func showNormalSpinner() {
        CharcoalSpinner.show(dismissOnTouch: false)
    }
    
    @objc func showTransparentSpinner() {
        CharcoalSpinner.show(transparentBackground: true, dismissOnTouch: true)
    }
    
    @objc func dismissSpinner() {
        CharcoalSpinner.dismiss()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 17.0, *)
#Preview {
    let view = CharcoalSpinnerPreview()
    return view
}
