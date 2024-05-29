import UIKit

protocol CharcoalIdentifiableOverlayDelegate: AnyObject {
    func overlayViewDidDismiss(_ id: CharcoalIdentifiableOverlayView.IDValue)
}

public class CharcoalIdentifiableOverlayView: UIView, Identifiable {
    public typealias IDValue = UUID

    public typealias ActionComplete = (Bool) -> Void

    public typealias ActionContent = (ActionComplete?) -> Void

    public let id = IDValue()

    let interactionMode: CharcoalOverlayInteractionMode

    /// Action to show the overlay.
    var showAction: ActionContent?

    /// Action to dismiss the overlay.
    var dismissAction: ActionContent?

    weak var delegate: CharcoalIdentifiableOverlayDelegate?

    init(interactionMode: CharcoalOverlayInteractionMode) {
        self.interactionMode = interactionMode
        super.init(frame: .zero)
        backgroundColor = UIColor.clear

        switch interactionMode {
        case .block:
            isUserInteractionEnabled = true
        case .dimissOnTouch:
            isUserInteractionEnabled = true
        case .passThrough:
            isUserInteractionEnabled = false
        }
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        // Dismiss on tap or scroll
        if interactionMode == .dimissOnTouch {
            dismiss()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func display() {
        showAction?(nil)
    }

    @objc func dismiss() {
        dismissAction?() { [weak self] _ in
            guard let self = self else { return }
            self.delegate?.overlayViewDidDismiss(self.id)
            self.removeFromSuperview()
        }
    }

    /// Make sure that the view is not blocking the touch events of the subview.
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled {
            for subview in subviews {
                let convertedPoint = subview.convert(point, from: self)
                if let hitView = subview.hitTest(convertedPoint, with: event) {
                    return hitView
                }
            }
            return nil
        }
        return super.hitTest(point, with: event)
    }
}
