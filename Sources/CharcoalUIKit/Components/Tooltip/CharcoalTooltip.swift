import UIKit

class CharcoalTooltip {}

extension CharcoalTooltip {
    static func show(text: String, anchorView: UIView, on: UIView? = nil) {
        let anchorPoint = CGPoint(x: 100, y: 0)
        let tooltip = CharcoalTooltipView(text: text, targetPoint: anchorPoint)
        
        tooltip.translatesAutoresizingMaskIntoConstraints = false
        CharcoalOverlayView.shared.show(view: tooltip, interactionPassthrough: false, anchorPoint: anchorPoint, on: on)
    }
}


@available(iOS 17.0, *)
#Preview(traits: .defaultLayout) {
    let view = UIView()
    
    let button = CharcoalPrimaryMButton()
    button.setTitle("OK", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])

//    let tooltip2 = CharcoalTooltipView(text: "Hello World This is a tooltip", targetPoint: CGPoint(x: 110, y: 10))
//    
//    let tooltip3 = CharcoalTooltipView(text: "here is testing it's multiple line feature", targetPoint: CGPoint(x: 50, y: 55))
//    
//    let tooltip4 = CharcoalTooltipView(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", targetPoint: CGPoint(x: -10, y: 25))
    
    CharcoalTooltip.show(text: "Hello World", anchorView: button)

    return view
}
