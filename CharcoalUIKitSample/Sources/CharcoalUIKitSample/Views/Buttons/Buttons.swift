import Charcoal
import UIKit

final class ButtonsViewController: UIViewController {
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.bounces = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.spacing = 16
        view.alignment = .center
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var buttons: [ButtonExample] = [
        // Primary
        ButtonExample(title: "Primary Button M", buttonStyle: CharcoalPrimaryMButton.self, isEnabled: true),
        ButtonExample(title: "Primary Button M", buttonStyle: CharcoalPrimaryMButton.self, isEnabled: false),
        ButtonExample(title: "Primary Button S", buttonStyle: CharcoalPrimarySButton.self, isEnabled: true),
        ButtonExample(title: "Primary Button S", buttonStyle: CharcoalPrimarySButton.self, isEnabled: false),
        // Default
        ButtonExample(title: "Default Button M", buttonStyle: CharcoalDefaultMButton.self, isEnabled: true),
        ButtonExample(title: "Default Button M", buttonStyle: CharcoalDefaultMButton.self, isEnabled: false),
        ButtonExample(title: "Default Button S", buttonStyle: CharcoalDefaultSButton.self, isEnabled: true),
        ButtonExample(title: "Default Button S", buttonStyle: CharcoalDefaultSButton.self, isEnabled: false),
        // Default Overlay
        ButtonExample(title: "Default Overlay Button M", buttonStyle: CharcoalDefaultOverlayMButton.self, isEnabled: true),
        ButtonExample(title: "Default Overlay Button M", buttonStyle: CharcoalDefaultOverlayMButton.self, isEnabled: false),
        ButtonExample(title: "Default Overlay Button S", buttonStyle: CharcoalDefaultOverlaySButton.self, isEnabled: true),
        ButtonExample(title: "Default Overlay Button S", buttonStyle: CharcoalDefaultOverlaySButton.self, isEnabled: false),
        // Navigation
        ButtonExample(title: "Navigation Button M", buttonStyle: CharcoalNavigationMButton.self, isEnabled: true),
        ButtonExample(title: "Navigation Button S", buttonStyle: CharcoalNavigationSButton.self, isEnabled: true),
        // Link Button
        ButtonExample(title: "Link Button", buttonStyle: CharcoalLinkButton.self, isEnabled: true),
        ButtonExample(title: "Link Button", buttonStyle: CharcoalLinkButton.self, isEnabled: false),
        // Premium Color
        ButtonExample(title: "Primary Button M(Premium Color)", buttonStyle: CharcoalPrimaryMButton.self, isEnabled: true, color: UIColor.systemOrange),
        ButtonExample(title: "Primary Button M(Premium Color)", buttonStyle: CharcoalPrimaryMButton.self, isEnabled: false, color: UIColor.systemOrange),
    ]
    
    var switchingButton: CharcoalSwitchingButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addButtons()
        setupSwitchingButton()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.systemBackground

        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func addButtons() {
        for example in buttons {
            let button = example.buttonStyle.init()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(example.title, for: .normal)
            button.isEnabled = example.isEnabled
            if let buttonColor = example.color, let pButton = button as? CharcoalPrimaryMButton {
                pButton.primaryColor = buttonColor
            }
            stackView.addArrangedSubview(button)
        }
    }

    private func setupSwitchingButton() {
        switchingButton = CharcoalSwitchingButton()
        switchingButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(switchingButton)
        
        let onButton = CharcoalDefaultMButton()
        onButton.setTitle("フォロー中", for: .normal)
        onButton.addTarget(self, action: #selector(handleSwitchingButtonTapped), for: .touchUpInside)

        let offButton = CharcoalPrimaryMButton()
        offButton.setTitle("フォローする", for: .normal)
        offButton.addTarget(self, action: #selector(handleSwitchingButtonTapped), for: .touchUpInside)

        switchingButton.register(onButton: onButton, offButton: offButton)
        switchingButton.isOn = false
    }

    @objc func handleSwitchingButtonTapped(_ button: UIButton) {
        switchingButton.isOn = !switchingButton.isOn
    }
}

extension ButtonsViewController {
    struct ButtonExample {
        let title: String
        let buttonStyle: CharcoalButton.Type
        let isEnabled: Bool
        let color: UIColor?
        
        init(title: String, buttonStyle: CharcoalButton.Type, isEnabled: Bool, color: UIColor? = nil) {
            self.title = title
            self.buttonStyle = buttonStyle
            self.isEnabled = isEnabled
            self.color = color
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = ButtonsViewController()
    return viewController
}
