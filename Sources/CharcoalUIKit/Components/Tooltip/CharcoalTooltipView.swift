import UIKit

class CharcoalTooltipView: UIView {

    init(text: String) {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayer() {
    }

    private func startAnimating() {

    }

    override var intrinsicContentSize: CGSize {
        return CGSize.zero
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0

    let tooltip = CharcoalTooltipView(text: "Hello")

    stackView.addArrangedSubview(tooltip)

    return stackView
}
