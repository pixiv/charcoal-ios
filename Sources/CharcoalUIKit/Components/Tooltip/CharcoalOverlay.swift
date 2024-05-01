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
            containerView = UIView(frame: .zero)
            containerView?.alpha = 0
            guard let containerView = containerView else {
                fatalError("Container view is nil.")
            }
            containerView.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(containerView)
            
            let constraints: [NSLayoutConstraint] = [
                containerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
                containerView.topAnchor.constraint(equalTo: mainView.topAnchor),
                containerView.heightAnchor.constraint(equalTo: mainView.heightAnchor),
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
        anchorView: UIView? = nil,
        on superView: UIView? = nil
    ) {
        setupSuperView(view: superView)
        setupBackground(interactionPassthrough)
        setupContainer()
        
        layoutIfNeeded()
        
        containerView!.addSubview(view)
        
        if let anchorView = anchorView, let anchorableView = view as? CharcoalAnchorable  {
            let spacing: CGFloat = 4
            let viewSize = view.intrinsicContentSize
            let anchorPoint = anchorView.superview!.convert(anchorView.center, to: containerView)
            let targetPoint = anchorView.superview!.convert(anchorView.center, to: view)
            let anchorViewHalfHeight = anchorView.frame.size.height / 2.0
            let anchroViewMaxY = anchorPoint.y + anchorViewHalfHeight
            let anchroViewMinY = anchorPoint.y - anchorViewHalfHeight
            print("containerView!.frame.width \(mainView!.frame.width)")
            
            let viewLeadingConstant = min(max(16, anchorPoint.x - viewSize.width / 2.0), mainView!.frame.width - viewSize.width - 16)
            
            var viewTopConstant: CGFloat
            
            if (anchroViewMinY - spacing >= viewSize.height) {
                viewTopConstant = anchroViewMinY - spacing - viewSize.height - anchorableView.arrowHeight
            } else {
                viewTopConstant = anchroViewMaxY + spacing + anchorableView.arrowHeight
            }
            
            let newTargetPoint = CGPoint(x: targetPoint.x - viewLeadingConstant, y: targetPoint.y - viewTopConstant)
            anchorableView.updateTargetPoint(point: newTargetPoint)
            
            print("anchor point \(anchorPoint) leading \(viewLeadingConstant) top \(viewTopConstant)")
            
            let constraints: [NSLayoutConstraint] = [
                view.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor, constant: viewLeadingConstant),
                view.topAnchor.constraint(equalTo: containerView!.topAnchor, constant: viewTopConstant),
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

