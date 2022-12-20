import Charcoal
import UIKit

final class ButtonsViewController: UIViewController {
    @IBOutlet var switchingButton: CharcoalSwitchingButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSwitchingButton()
    }

    private func setupSwitchingButton() {
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
