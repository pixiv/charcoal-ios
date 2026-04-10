import CharcoalShared
import UIKit

public struct CharcoalModalAction: Sendable {
    public enum Style: Sendable {
        public typealias Handler = @MainActor @Sendable () -> Void

        case primary(_ handler: Handler)
        case normal(_ handler: Handler)
        case destractive(_ handler: Handler)
        case cancel
    }

    let title: String
    let style: Style

    public init(title: String, style: Style) {
        self.title = title
        self.style = style
    }
}

final class CharcoalModalActionsView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dismiss: (() -> Void)?

    func addAction(_ action: CharcoalModalAction) {
        let button: CharcoalButton

        switch action.style {
        case let .primary(handler):
            button = CharcoalPrimaryMButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(action.title, for: .normal)
            button.addAction(
                .init { _ in handler() },
                for: .touchUpInside
            )

        case let .normal(handler):
            button = CharcoalDefaultMButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(action.title, for: .normal)
            button.addAction(
                .init { _ in handler() },
                for: .touchUpInside
            )

        case .cancel:
            button = CharcoalDefaultMButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(action.title, for: .normal)
            button.addAction(
                .init { [weak self] _ in self?.dismiss?() },
                for: .touchUpInside
            )

        case let .destractive(handler):
            let primaryButton = CharcoalPrimaryMButton()
            primaryButton.primaryColor = CharcoalAsset.ColorPaletteGenerated.assertive.color

            button = primaryButton
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(action.title, for: .normal)
            button.addAction(
                .init { _ in handler() },
                for: .touchUpInside
            )
        }

        stackView.addArrangedSubview(button)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let buttonHeights = stackView.subviews.map(\.intrinsicContentSize.height)

        let totalButtonHeight: CGFloat = buttonHeights.reduce(0, +)
        let totalSpacing: CGFloat = 8 * CGFloat(buttonHeights.count - 1)
        let totalPadding: CGFloat = 40

        return CGSize(
            width: size.width,
            height: totalButtonHeight + totalSpacing + totalPadding
        )
    }
}

@available(iOS 17, *)
#Preview {
    let actionsView = CharcoalModalActionsView()
    actionsView.addAction(.init(
        title: "Primary Action",
        style: .primary({})
    ))
    actionsView.addAction(.init(
        title: "Normal Action",
        style: .normal({})
    ))
    actionsView.addAction(.init(
        title: "Cancel Action",
        style: .cancel
    ))
    actionsView.addAction(.init(
        title: "Destractive Action",
        style: .destractive({})
    ))

    actionsView.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface3.color
    actionsView.clipsToBounds = true
    actionsView.layer.cornerRadius = 32
    actionsView.layer.maskedCorners = [
        .layerMinXMaxYCorner,
        .layerMaxXMaxYCorner,
    ]

    return actionsView
}
