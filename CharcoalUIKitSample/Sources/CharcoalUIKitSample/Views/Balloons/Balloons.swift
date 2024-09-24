import Charcoal
import UIKit

enum BalloonTitles: String, CaseIterable {
    case leading = "Leading"
    case trailing = "Trailing"
    case bottom = "Bottom"

    var text: String {
        switch self {
        case .leading:
            return "Hello World"
        case .trailing:
            return "Hello World This is a tooltip with mutiple line"
        case .bottom:
            return "こんにちは This is a tooltip and here is testing it's multiple line feature"
        }
    }

    func configCell(cell: BalloonTableViewCell) {
        cell.titleLabel.text = rawValue
        switch self {
        case .leading:
            cell.leadingImageView.image = CharcoalAsset.Images.info24.image
        case .trailing:
            cell.accessoryImageView.image = CharcoalAsset.Images.info24.image
        case .bottom:
            break
        }
    }
}

public final class BalloonsViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var bottomInfoImage: UIImageView = {
        let imageView = UIImageView(image: CharcoalAsset.Images.info16.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private enum Sections: Int, CaseIterable {
        case components

        var title: String {
            switch self {
            case .components:
                return "Balloons"
            }
        }

        var items: [any CaseIterable] {
            switch self {
            case .components:
                return TooltipTitles.allCases
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

        view.addSubview(bottomInfoImage)

        NSLayoutConstraint.activate([
            bottomInfoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomInfoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

extension BalloonsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Sections.allCases[indexPath.section]

        let cellIdentifier = BalloonTableViewCell.identifier
        let cell: BalloonTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? BalloonTableViewCell ?? BalloonTableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        switch section {
        case .components:
            let titleCase = BalloonTitles.allCases[indexPath.row]
            titleCase.configCell(cell: cell)
            return cell
        }
    }

    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections.allCases[section].items.count
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! BalloonTableViewCell
        tableView.deselectRow(at: indexPath, animated: true)
        let titleCase = BalloonTitles.allCases[indexPath.row]
        switch titleCase {
        case .leading:
            // use on: self.view to stick the balloon to the view
            // so balloons will dismiss with the view
            CharcoalBalloon.show(text: titleCase.text, anchorView: cell.leadingImageView, on: self.view)
        case .trailing:
            CharcoalBalloon.show(text: titleCase.text, anchorView: cell.accessoryImageView, on: self.view)
        case .bottom:
            CharcoalBalloon.show(text: titleCase.text, anchorView: bottomInfoImage, on: self.view)
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections.allCases[section].title
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = BalloonsViewController()
    return viewController
}
