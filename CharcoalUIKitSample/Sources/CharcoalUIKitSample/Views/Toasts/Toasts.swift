import Charcoal
import UIKit

enum SnackbarTitles: String, CaseIterable {
    case normal = "Normal"
    case withAction = "with Action"
    case withActionAndThumbnail = "with Action and Thumbnail"

    var text: String {
        return "ブックマークしました"
    }

    func configCell(cell: UITableViewCell) {
        cell.textLabel!.text = "SnackBar"
        cell.detailTextLabel?.text = rawValue
    }
}

enum ToastsTitles: String, CaseIterable {
    case normal = "Normal"
    case normalWithAction = "with Action"
    case errorWithAction = "error with Action"

    var text: String {
        switch self {
        case .normal:
            return "Hello World"
        case .normalWithAction:
            return "Hello World This is a tooltip with mutiple line"
        case .errorWithAction:
            return "こんにちは This is a tooltip and here is testing it's multiple line feature"
        }
    }

    func configCell(cell: UITableViewCell) {
        cell.textLabel!.text = "Toast"
        cell.detailTextLabel?.text = rawValue
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
        case snackbars
        case toasts

        var title: String {
            switch self {
            case .toasts:
                return "Toasts"
            case .snackbars:
                return "Snackbars"
            }
        }

        var items: [any CaseIterable] {
            switch self {
            case .toasts:
                return ToastsTitles.allCases
            case .snackbars:
                return SnackbarTitles.allCases
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

        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell? ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)

        switch section {
        case .toasts:
            let titleCase = ToastsTitles.allCases[indexPath.row]
            titleCase.configCell(cell: cell)
            return cell
        case .snackbars:
            let titleCase = SnackbarTitles.allCases[indexPath.row]
            titleCase.configCell(cell: cell)
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
        case .toasts:
            let titleCase = ToastsTitles.allCases[indexPath.row]

            var toastID: CharcoalIdentifiableOverlayView.IDValue
            switch titleCase {
            case .normal:
                toastID = CharcoalToast.show(text: titleCase.text, screenEdge: .top)
            case .normalWithAction:
                toastID = CharcoalToast.show(text: titleCase.text, screenEdge: .bottom, actionCallback: {
                    print("Clicked on action")
                })
            case .errorWithAction:
                toastID = CharcoalToast.show(
                    text: titleCase.text,
                    appearance: .error,
                    screenEdge: .bottom,
                    actionCallback: {
                        print("Clicked on action")
                    }
                )
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                CharcoalToast.dismiss(id: toastID)
            }
        case .snackbars:
            let titleCase = SnackbarTitles.allCases[indexPath.row]

            var toastID: CharcoalIdentifiableOverlayView.IDValue
            switch titleCase {
            case .normal:
                toastID = CharcoalSnackBar.show(text: titleCase.text, screenEdge: .top)
            case .withAction:
                toastID = CharcoalSnackBar.show(text: titleCase.text, screenEdge: .bottom, action: CharcoalAction(title: "編集", actionCallback: {
                    print("Tapped 編集")
                }))
            case .withActionAndThumbnail:
                toastID = CharcoalSnackBar.show(text: titleCase.text, thumbnailImage: UIImage(named: "SnackbarDemo", in: Bundle.module, with: nil), screenEdge: .bottom, action: CharcoalAction(title: "編集", actionCallback: {
                    print("Tapped 編集")
                }))
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                CharcoalSnackBar.dismiss(id: toastID)
            }
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
