import UIKit

public class CharcoalTooltip {}

public extension CharcoalTooltip {
    static func show(text: String, anchorView: UIView, on: UIView? = nil) {
        let tooltip = CharcoalTooltipView(text: text, targetPoint: .zero)

        tooltip.translatesAutoresizingMaskIntoConstraints = false
        ChacoalOverlayManager.shared.show(view: tooltip, interactionMode: .dimissOnTap, anchorView: anchorView, on: on)
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

    let button2 = CharcoalPrimaryMButton()
    button2.setTitle("OK", for: .normal)
    button2.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button2)

    NSLayoutConstraint.activate([
        button2.topAnchor.constraint(equalTo: view.topAnchor),
        button2.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    ])

    let button3 = CharcoalPrimaryMButton()
    button3.setTitle("OK", for: .normal)
    button3.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button3)

    NSLayoutConstraint.activate([
        button3.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        button3.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    DispatchQueue.main.async {
        CharcoalTooltip.show(text: "Hello World", anchorView: button)

        CharcoalTooltip.show(text: "Hello World This is a tooltip", anchorView: button2)

        CharcoalTooltip.show(text: "こんにちは This is a tooltip and here is testing it's multiple line feature", anchorView: button3)
    }

    return view
}
