import UIKit

class CharcoalIdentifiableOverlayView: UIView {
    
    let interactionMode: CharcoalOverlayInteractionMode
    
    init(interactionMode: CharcoalOverlayInteractionMode) {
        self.interactionMode = interactionMode
        super.init(frame: .zero)
        self.backgroundColor = UIColor.clear
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display() {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.alpha = 1
        })
    }
    
    @objc func dismiss() {
        print("dismiss")
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.alpha = 0
        }) {
            [weak self] _ in
            self?.removeFromSuperview()
        }
    }
}
