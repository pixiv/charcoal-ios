import UIKit

protocol CharcoalIdentifiableOverlayDelegate: AnyObject {
    func overlayViewDidDismiss(_ overlayView: CharcoalIdentifiableOverlayView)
}

class CharcoalIdentifiableOverlayView: UIView, Identifiable {
    typealias IDValue = UUID

    let id = IDValue()

    let interactionMode: CharcoalOverlayInteractionMode

    weak var delegate: CharcoalIdentifiableOverlayDelegate?

    init(interactionMode: CharcoalOverlayInteractionMode) {
        self.interactionMode = interactionMode
        super.init(frame: .zero)
        backgroundColor = UIColor.clear

        switch interactionMode {
        case .block:
            isUserInteractionEnabled = true
        case .dimissOnTap:
            isUserInteractionEnabled = true
            // Add dismiss tap gesture
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss))
            addGestureRecognizer(tapGesture)
        case .passThrough:
            isUserInteractionEnabled = false
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
