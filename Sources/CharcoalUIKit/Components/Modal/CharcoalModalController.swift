import CharcoalShared
import UIKit

@available(iOS 15, *)
public final class CharcoalModalController: UIViewController {
    let titleText: String?
    let message: String?
    let content: UIView?

    public var tapBackgroundToDismiss: Bool = true
    public var contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)

    public init(title: String?, message: String?, content: UIView?) {
        titleText = title
        self.message = message
        self.content = content
        super.init(nibName: nil, bundle: nil)

        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let actionsView = CharcoalModalActionsView()

    public func addAction(_ action: CharcoalModalAction) {
        actionsView.addAction(action)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(onBackgroundTapped(_:))
        ))

        let modalBackgroundView = UIView()
        modalBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        modalBackgroundView.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface1.color
        modalBackgroundView.clipsToBounds = true
        modalBackgroundView.layer.cornerRadius = 32
        modalBackgroundView.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(onModalBackgroundTapped(_:))
        ))

        let header = CharcoalModalHeader(
            title: titleText,
            closeButtonTapped: { [weak self] in
                self?.dismiss(animated: true)
            }
        )
        header.translatesAutoresizingMaskIntoConstraints = false
        header.isCloseButtonHidden = !tapBackgroundToDismiss

        let contentView = CharcoalModalContentView(
            message: message,
            content: content
        )
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.contentEdgeInsets = contentEdgeInsets

        actionsView.translatesAutoresizingMaskIntoConstraints = false
        actionsView.dismiss = { [weak self] in self?.dismiss(animated: true) }

        view.addSubview(modalBackgroundView)
        modalBackgroundView.addSubview(header)
        modalBackgroundView.addSubview(contentView)
        modalBackgroundView.addSubview(actionsView)

        NSLayoutConstraint.activate([
            modalBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            modalBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            modalBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            header.topAnchor.constraint(equalTo: modalBackgroundView.topAnchor),
            header.leadingAnchor.constraint(equalTo: modalBackgroundView.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: modalBackgroundView.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: header.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: modalBackgroundView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: modalBackgroundView.trailingAnchor),

            actionsView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            actionsView.leadingAnchor.constraint(equalTo: modalBackgroundView.leadingAnchor),
            actionsView.trailingAnchor.constraint(equalTo: modalBackgroundView.trailingAnchor),
            actionsView.bottomAnchor.constraint(equalTo: modalBackgroundView.bottomAnchor),
        ])
    }

    @objc private func onBackgroundTapped(_ sender: UITapGestureRecognizer) {
        if tapBackgroundToDismiss {
            dismiss(animated: true)
        }
    }

    @objc private func onModalBackgroundTapped(_ sender: UITapGestureRecognizer) {}
}

#if DEBUG
@available(iOS 15, *)
private final class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        var configuration = UIButton.Configuration.plain()
        configuration.title = "Show"
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show", for: .normal)
        button.addAction(
            .init { [weak self] _ in
                let charcoalModalController = CharcoalModalController(
                    title: "Title",
                    message: "message",
                    content: nil
                )
                charcoalModalController.addAction(.init(
                    title: "Primary Action",
                    style: .primary {
                        print("Primary action tapped")
                    }
                ))
                charcoalModalController.addAction(.init(
                    title: "Cancel",
                    style: .cancel
                ))

                self?.present(charcoalModalController, animated: true)
            },
            for: .touchUpInside
        )

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
#endif

@available(iOS 17, *)
#Preview {
    RootViewController()
}
