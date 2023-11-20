import UIKit

public final class ContentViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private enum ComponentTitles: String, CaseIterable {
        case buttons = "Buttons"
        case textFields = "TextFields"
        case selections = "Selections"
        case colors = "Colors"
        case typographies = "Typographies"
        case icons = "Icons"
        
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
            }
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Charcoal"
        let darkModeSwitch = UISwitch()
        darkModeSwitch.isOn = UITraitCollection.current.userInterfaceStyle == .dark
        darkModeSwitch.addTarget(self, action: #selector(toggleDarkModeSwitch(_:)), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: darkModeSwitch)
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
    
    @objc private func toggleDarkModeSwitch(_ sender: UISwitch) {
        let keyWindow = UIApplication.shared.windows
            .first { $0.isKeyWindow }
        keyWindow?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
    }
}

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        let title = ComponentTitles.allCases[indexPath.row].rawValue
        
        cell.textLabel?.text = title
        
        return cell
    }
    
    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return ComponentTitles.allCases.count
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let titleCase = ComponentTitles.allCases[indexPath.item]
        let viewController = titleCase.viewController
        viewController.title = titleCase.rawValue
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "UI LIBRARY"
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = ContentViewController()
    return viewController
}
