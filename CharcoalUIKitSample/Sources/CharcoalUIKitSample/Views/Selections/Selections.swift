import Charcoal
import UIKit

final class SelectionsViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var disabledCharcoalSwitch: CharcoalSwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        setupUI()
        addSwitches()
    }

    private func setupUI() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    private func addSwitches() {
        let switchObject = CharcoalSwitch()
        let firstSwitchView = createSwitchView(title: "Toggle", switchObject: switchObject)
        switchObject.addTarget(self, action: #selector(didChangedSwitchValue), for: .valueChanged)
        stackView.addArrangedSubview(firstSwitchView)

        addDisabledSwitch()
    }

    private func addDisabledSwitch() {
        disabledCharcoalSwitch = CharcoalSwitch()
        disabledCharcoalSwitch.isEnabled = false

        let switchView = createSwitchView(title: "Toggle Disabled", switchObject: disabledCharcoalSwitch)

        stackView.addArrangedSubview(switchView)
    }

    private func createSwitchView(title: String, switchObject: CharcoalSwitch) -> UIView {
        let stackview = UIStackView(frame: .zero)
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.alignment = .center
        let label = CharcoalTypography14()
        label.text = title

        switchObject.isOn = true

        stackview.addArrangedSubview(label)
        stackview.addArrangedSubview(switchObject)

        return stackview
    }

    @objc private func didChangedSwitchValue(_ sender: CharcoalSwitch) {
        disabledCharcoalSwitch.isOn = sender.isOn
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = SelectionsViewController()
    return viewController
}
