import UIKit

public final class ContentViewController: UITableViewController {
    public class func instantiate() -> UIViewController {
        let viewController = UIStoryboard(name: "Content", bundle: .module).instantiateInitialViewController()!
        return UINavigationController(rootViewController: viewController)
    }

    private let storyboardTitles = ["Buttons", "TextFields", "Selections", "Colors", "Typographies"]

    override public func viewDidLoad() {
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

    public override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return storyboardTitles.count
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let title = storyboardTitles[indexPath.item]
        guard let viewController = UIStoryboard(name: title, bundle: .module).instantiateInitialViewController() else {
            return
        }
        viewController.title = title
        navigationController?.pushViewController(viewController, animated: true)
    }
}
