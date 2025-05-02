import CharcoalShared
import UIKit

final class CharcoalModalContentView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    var contentEdgeInsets: UIEdgeInsets {
        get { stackView.layoutMargins }
        set { stackView.layoutMargins = newValue }
    }

    init(message: String?, content: UIView?) {
        super.init(frame: .null)

        if let message {
            let messageLabel = CharcoalTypography16()
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.text = message
            messageLabel.textAlignment = .center
            messageLabel.numberOfLines = 0

            stackView.addArrangedSubview(messageLabel)
        }

        if let content {
            content.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(content)
        }

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let subViewHeights = stackView.subviews.map({ $0.sizeThatFits(size).height })

        let totalButtonHeight: CGFloat = subViewHeights.reduce(0, +)
        let totalSpacing: CGFloat = 8 * CGFloat(subViewHeights.count - 1)
        let totalPadding: CGFloat = 40

        return CGSize(
            width: size.width,
            height: totalButtonHeight + totalSpacing + totalPadding
        )
    }
}

@available(iOS 17, *)
#Preview {
    let contentView = CharcoalModalContentView(
        message: "MessageMessageMessageMessageMessageMessageMessage",
        content: SpinnerContainerView(
            subview: CharcoalSpinnerView(spinnerSize: 48)
        )
    )
    contentView.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface3.color

    return contentView
}
