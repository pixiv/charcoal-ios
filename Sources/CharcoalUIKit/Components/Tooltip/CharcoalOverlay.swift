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
                
                print("shows on main")
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
            backgroundView = UIView(frame: .zero)
            
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
    
    private func setupContainer() {
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
                containerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0),
                containerView.heightAnchor.constraint(equalTo: mainView.widthAnchor),
                containerView.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            ]
            
            NSLayoutConstraint.activate(constraints)
        }
    }
}

// MARK: - Show, Dismiss

extension CharcoalOverlayView {
    func show(
        view: UIView,
        transparentBackground: Bool = false,
        interactionPassthrough: Bool,
        anchorPoint: CGPoint? = nil,
        on superView: UIView? = nil
    ) {
        setupSuperView(view: superView)
        setupBackground(interactionPassthrough)
        setupContainer()
        containerView!.addSubview(view)
        
        if let anchorPoint = anchorPoint {
            let constraints: [NSLayoutConstraint] = [
                view.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor, constant: anchorPoint.x),
                view.topAnchor.constraint(equalTo: containerView!.topAnchor, constant: anchorPoint.y),
            ]
            NSLayoutConstraint.activate(constraints)
        }
        
        display()
    }
    
    func display() {
        print("display")
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.containerView?.alpha = 1
        })
    }
}

