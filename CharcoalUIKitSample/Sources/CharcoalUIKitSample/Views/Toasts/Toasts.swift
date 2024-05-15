import Charcoal
import UIKit

enum ToastsTitles: String, CaseIterable {
    case top = "Top"
    case bottom = "Bottom"
    case multiline = "Multiline"

    var text: String {
        switch self {
        case .top:
            return "Hello World"
        case .bottom:
            return "Hello World This is a tooltip with mutiple line"
        case .multiline:
            return "こんにちは This is a tooltip and here is testing it's multiple line feature"
        }
    }

    func configCell(cell: UITableViewCell) {
        cell.textLabel!.text = rawValue
    }
}

public final class ToastsViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cellReuseIdentifier = "cell"
    
    private enum Sections: Int, CaseIterable {
        case components

        var title: String {
            switch self {
            case .components:
                return "Toasts"
            }
        }

        var items: [any CaseIterable] {
            switch self {
            case .components:
                return TooltipTitles.allCases
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

extension ToastsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Sections.allCases[indexPath.section]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)

        switch section {
        case .components:
            let titleCase = ToastsTitles.allCases[indexPath.row]
            titleCase.configCell(cell: cell)
            return cell
        }
    }

    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections.allCases[section].items.count
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let titleCase = ToastsTitles.allCases[indexPath.row]
        
        var toastID: CharcoalIdentifiableOverlayView.IDValue
        switch titleCase {
        case .top:
            toastID = CharcoalToast.show(text: titleCase.text, screenEdge: .top)
        case .bottom:
            toastID =  CharcoalToast.show(text: titleCase.text, appearance: .error, screenEdge: .bottom)
        case .multiline:
            toastID = CharcoalToast.show(text: titleCase.text, screenEdge: .bottom)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            CharcoalToast.dismiss(id: toastID)
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
    let viewController = ToastsViewController()
    return viewController
}
