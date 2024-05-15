import UIKit

protocol CharcoalIdentifiableOverlayDelegate: AnyObject {
    func overlayViewDidDismiss(_ overlayView: CharcoalIdentifiableOverlayView)
}

public class CharcoalIdentifiableOverlayView: UIView, Identifiable {
    public typealias IDValue = UUID

    public let id = IDValue()

    let interactionMode: CharcoalOverlayInteractionMode

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
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.alpha = 1
        })
    }

    @objc func dismiss() {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.alpha = 0
        }) {
            [weak self] _ in
            guard let self = self else { return }
            self.removeFromSuperview()
            self.delegate?.overlayViewDidDismiss(self)
        }
    }
}
