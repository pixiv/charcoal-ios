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
        let switchStack = UIStackView(frame: .zero)
        switchStack.axis = .horizontal
        let label = CharcoalTypography14()
        label.text = "Toggle"
        let firstSwitch = CharcoalSwitch()
        firstSwitch.addTarget(self, action: #selector(didChangedSwitchValue), for: .valueChanged)
        firstSwitch.isOn = true
        
        switchStack.addArrangedSubview(label)
        switchStack.addArrangedSubview(firstSwitch)
        
        stackView.addArrangedSubview(switchStack)
        
        addDisabledSwitch()
    }
    
    private func addDisabledSwitch() {
        let switchStackSecond = UIStackView(frame: .zero)
        switchStackSecond.axis = .horizontal
        let labelSecond = CharcoalTypography14()
        labelSecond.text = "Toggle Disabled"
        disabledCharcoalSwitch = CharcoalSwitch()
        disabledCharcoalSwitch.isOn = true
        disabledCharcoalSwitch.isEnabled = false
        
        switchStackSecond.addArrangedSubview(labelSecond)
        switchStackSecond.addArrangedSubview(disabledCharcoalSwitch)
        
        stackView.addArrangedSubview(switchStackSecond)
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
