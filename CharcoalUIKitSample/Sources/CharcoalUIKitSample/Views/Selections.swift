import CharcoalUIKit
import UIKit

final class SelectionsViewController: UIViewController {
    @IBOutlet var disabledCharcoalSwitch: CharcoalSwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didChangedSwitchValue(_ sender: CharcoalSwitch) {
        disabledCharcoalSwitch.isOn = sender.isOn
    }
}
