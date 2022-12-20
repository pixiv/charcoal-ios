import Charcoal
import UIKit

final class CharcoalSelectionsViewController: UIViewController {
    @IBOutlet var disabledCharcoalSwitch: CharcoalSwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didChangedSwitchValue(_ sender: CharcoalSwitch) {
        disabledCharcoalSwitch.isOn = sender.isOn
    }
}
