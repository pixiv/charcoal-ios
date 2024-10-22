import Charcoal
import UIKit

final class HintsViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.bounces = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.spacing = 16
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let cellReuseIdentifier = "cell"

    private var hints: [CharcoalHintView] = [
        CharcoalHintView(text: "Hello World"),
        CharcoalHintView(text: "ブックマークしました"),
        CharcoalHintView(text: "ブックマークしました", action: CharcoalAction(title: "Button", actionCallback: {
            print("Button taped")
        })),
        CharcoalHintView(
            text: "こんにちは",
            action: CharcoalAction(title: "Button", actionCallback: {
                print("Button taped")
            })
        )
    ]

    private var switchingButton: CharcoalSwitchingButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addHintViews()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func addHintViews() {
        for example in hints {
            let hint = example
            hint.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(hint)
            hint.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        }
    }

}

@available(iOS 17.0, *)
#Preview {
    let viewController = HintsViewController()
    return viewController
}
