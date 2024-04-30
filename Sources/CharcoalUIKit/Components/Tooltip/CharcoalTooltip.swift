import UIKit

class CharcoalTooltip {}

extension CharcoalTooltip {
    static func show(text: String, anchorView: UIView, on: UIView? = nil) {
        let tooltip = CharcoalTooltipView(text: text, targetPoint: CGPoint(x: 0, y: 0))
        
        tooltip.translatesAutoresizingMaskIntoConstraints = false
        CharcoalOverlayView.shared.show(view: tooltip, interactionPassthrough: true, anchorView: anchorView, on: on)
    }
}


@available(iOS 17.0, *)
#Preview() {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray
    
    let button = CharcoalPrimaryMButton()
    button.setTitle("OK", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    let debugContainerView = UIView(frame: .zero)
    debugContainerView.translatesAutoresizingMaskIntoConstraints = false
    debugContainerView.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    debugContainerView.isUserInteractionEnabled = false
    view.addSubview(debugContainerView)
    
    NSLayoutConstraint.activate([
        debugContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        debugContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        debugContainerView.widthAnchor.constraint(equalTo: view.widthAnchor),
        debugContainerView.heightAnchor.constraint(equalTo: view.widthAnchor)
    ])
//    let tooltip2 = CharcoalTooltipView(text: "Hello World This is a tooltip", targetPoint: CGPoint(x: 110, y: 10))
//    
//    let tooltip3 = CharcoalTooltipView(text: "here is testing it's multiple line feature", targetPoint: CGPoint(x: 50, y: 55))
//    
//    let tooltip4 = CharcoalTooltipView(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", targetPoint: CGPoint(x: -10, y: 25))
    
    DispatchQueue.main.async {
        CharcoalTooltip.show(text: "Hello World", anchorView: button, on: debugContainerView)
    }

    return view
}
