import UIKit

final class ColorsV2ViewController: UIViewController {
    private enum Item: String, CaseIterable {
        case applied = "Applied"
        case primitive = "Primitive"

        var listViewController: UIViewController {
            switch self {
            case .applied:
                return ColorsV2ListViewController(kind: .applied)
            case .primitive:
                return ColorsV2ListViewController(kind: .primitive)
            }
        }
    }

    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        view.backgroundColor = .systemBackground
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

extension ColorsV2ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return Item.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let identifier = "ColorsV2MenuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: identifier)
        let item = Item.allCases[indexPath.row]
        cell.textLabel?.text = item.rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = Item.allCases[indexPath.row]
        let viewController = item.listViewController
        viewController.title = item.rawValue
        navigationController?.pushViewController(viewController, animated: true)
    }
}

@available(iOS 17.0, *)
#Preview {
    return ColorsV2ViewController()
}
