import UIKit

public final class ContentViewController: UITableViewController {
    public class func instantiate() -> UIViewController {
        let viewController = UIStoryboard(name: "Content", bundle: .module).instantiateInitialViewController()!
        return UINavigationController(rootViewController: viewController)
    }
    
    enum StoryboardTitles: String, CaseIterable {
    case buttons = "Buttons"
    case textFields = "TextFields"
    case selections = "Selections"
    case colors = "Colors"
    case typographies = "Typographies"
    case Icons = "Icons"
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationItem.title = "Charcoal"

        let darkModeSwitch = UISwitch()
        darkModeSwitch.isOn = UITraitCollection.current.userInterfaceStyle == .dark
        darkModeSwitch.addTarget(self, action: #selector(toggleDarkModeSwitch(_:)), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: darkModeSwitch)
    }

    @objc func toggleDarkModeSwitch(_ sender: UISwitch) {
        let keyWindow = UIApplication.shared.windows
            .first { $0.isKeyWindow }
        keyWindow?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
    }

    public override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return StoryboardTitles.allCases.count
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let titleCase = StoryboardTitles.allCases[indexPath.item]
        let viewController = titleCase.viewController
        viewController.title = titleCase.rawValue
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ContentViewController.StoryboardTitles {
    var viewController: UIViewController {
        switch self {
        case .typographies:
            return TypographiesViewController()
        case .buttons:
            return ButtonsViewController()
        case .colors:
            return ColorsViewController()
        default:
            return UIStoryboard(name: rawValue, bundle: .module).instantiateInitialViewController()!
        }
    }
}
