import UIKit

final class ViewController: UITableViewController {
    private let storyboardTitles = ["Buttons", "TextFields", "Selections", "Colors", "Typography"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationItem.title = "Charcoal"

        if #available(iOS 13.0, *) {
            let darkModeSwitch = UISwitch()
            darkModeSwitch.isOn = UITraitCollection.current.userInterfaceStyle == .dark
            darkModeSwitch.addTarget(self, action: #selector(toggleDarkModeSwitch(_:)), for: .valueChanged)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: darkModeSwitch)
        }
    }

    @objc func toggleDarkModeSwitch(_ sender: UISwitch) {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.windows
                .first { $0.isKeyWindow }
            keyWindow?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return storyboardTitles.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let title = storyboardTitles[indexPath.item]
        guard let viewController = UIStoryboard(name: title, bundle: nil).instantiateInitialViewController() else {
            return
        }
        viewController.title = title
        navigationController?.pushViewController(viewController, animated: true)
    }
}
