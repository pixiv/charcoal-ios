import Charcoal
import UIKit

typealias ItemEnum = CaseIterable

public final class ContentViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private enum Sections: Int, CaseIterable {
        case components
        case settings

        var title: String {
            switch self {
            case .components:
                return "UI LIBRARY"
            case .settings:
                return "SETTINGS"
            }
        }

        var items: [any CaseIterable] {
            switch self {
            case .components:
                return ComponentTitles.allCases
            case .settings:
                return SettingsTitles.allCases
            }
        }

        var cellIdentifier: String {
            switch self {
            case .components:
                return "ComponentCell"
            case .settings:
                return "SettingsCell"
            }
        }
    }

    private enum ComponentTitles: String, CaseIterable {
        case buttons = "Buttons"
        case textFields = "TextFields"
        case selections = "Selections"
        case colors = "Colors"
        case typographies = "Typographies"
        case icons = "Icons"
        case tooltips = "Tooltips"
        case toasts = "Toasts"
        case spinners = "Spinners"

        var viewController: UIViewController {
            switch self {
            case .typographies:
                return TypographiesViewController()
            case .buttons:
                return ButtonsViewController()
            case .colors:
                return ColorsViewController()
            case .icons:
                return IconsViewController()
            case .selections:
                return SelectionsViewController()
            case .textFields:
                return TextFieldsViewController()
            case .tooltips:
                return TooltipsViewController()
            case .toasts:
                return ToastsViewController()
            case .spinners:
                return SpinnersViewController()
            }
        }
    }

    private enum SettingsTitles: String, CaseIterable {
        case darkMode = "Dark Mode"
        case fixedSizeCategory = "Fixed Size Category"
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }

    private func setupNavigationBar() {
        navigationItem.title = "Charcoal"
    }

    private func setupUI() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Sections.allCases[indexPath.section]

        let cellIdentifier = section.cellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        switch section {
        case .components:
            let title = ComponentTitles.allCases[indexPath.row].rawValue

            cell.textLabel?.text = title

            return cell
        case .settings:
            let setting = SettingsTitles.allCases[indexPath.row]

            cell.textLabel?.text = setting.rawValue
            let settingSwitch = UISwitch(frame: .zero, primaryAction: UIAction(handler: { [weak self] action in
                self?.performActionFor(setting: setting, sender: action.sender as! UISwitch)
            }))

            switch setting {
            case .darkMode:
                settingSwitch.isOn = traitCollection.userInterfaceStyle == .dark
            case .fixedSizeCategory:
                settingSwitch.isOn = CharcoalConfig.configUIKit.fixedSizeCategory != nil
            }

            cell.accessoryView = settingSwitch

            return cell
        }
    }

    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections.allCases[section].items.count
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let section = Sections.allCases[indexPath.section]

        switch section {
        case .components:
            let titleCase = ComponentTitles.allCases[indexPath.item]
            let viewController = titleCase.viewController
            viewController.title = titleCase.rawValue
            navigationController?.pushViewController(viewController, animated: true)
        case .settings:
            let cell = tableView.cellForRow(at: indexPath)
            let titleCase = SettingsTitles.allCases[indexPath.item]
            let sender = cell?.accessoryView as! UISwitch
            sender.isOn.toggle()
            performActionFor(setting: titleCase, sender: sender)
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections.allCases[section].title
    }
}

extension ContentViewController {
    private func performActionFor(setting: SettingsTitles, sender: UISwitch) {
        switch setting {
        case .darkMode:
            navigationController?.topViewController?.view.window?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        case .fixedSizeCategory:
            CharcoalConfig.configUIKit.fixedSizeCategory = sender.isOn ? .large : nil

            // Update current view controller as it is not controled by CharcoalConfig
            if #available(iOS 15.0, *) {
                self.view.maximumContentSizeCategory = CharcoalConfig.configUIKit.fixedSizeCategory
                self.view.minimumContentSizeCategory = CharcoalConfig.configUIKit.fixedSizeCategory
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = ContentViewController()
    return viewController
}
