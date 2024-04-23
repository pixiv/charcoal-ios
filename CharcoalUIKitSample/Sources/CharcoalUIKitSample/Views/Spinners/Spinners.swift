import Charcoal
import UIKit

final class SpinnersViewController: UIViewController {
    class SpinnerTypeTableViewCell: UITableViewCell {
        static let identifier = "SpinnerTypeTableViewCell"
    }

    enum SpinnerTypes: CaseIterable {
        case normal
        case transparent

        var title: String {
            switch self {
            case .normal:
                return "Normal"
            case .transparent:
                return "Transparent"
            }
        }
    }

    private lazy var tableview: UITableView = {
        let view = UITableView(frame: CGRect.zero, style: .insetGrouped)
        view.bounces = true
        view.register(SpinnerTypeTableViewCell.self, forCellReuseIdentifier: SpinnerTypeTableViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addDismissButton()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground

        view.addSubview(tableview)

        tableview.dataSource = self
        tableview.delegate = self

        NSLayoutConstraint.activate([
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func addDismissButton() {
        // Add to navigationBar
        
        let dismissButton = UIBarButtonItem(
            title: "Dismiss",
            style: .plain,
            target: self,
            action: #selector(dismissButtonTapped)
        )
        
        navigationItem.rightBarButtonItem = dismissButton
    }
    
    @objc func dismissButtonTapped() {
        CharcoalSpinner.dismiss()
    }
}

extension SpinnersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SpinnerTypes.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SpinnerTypeTableViewCell.identifier,
            for: indexPath
        ) as! SpinnerTypeTableViewCell

        let spinnerType = SpinnerTypes.allCases[indexPath.row]

        cell.textLabel?.text = spinnerType.title

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spinnerType = SpinnerTypes.allCases[indexPath.row]

        switch spinnerType {
        case .normal:
            CharcoalSpinner.show(on: view)
        case .transparent:
            CharcoalSpinner.show(transparentBackground: true, on: view)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = SpinnersViewController()
    return viewController
}
