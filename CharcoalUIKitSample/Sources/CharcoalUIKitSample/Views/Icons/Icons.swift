import Charcoal
import UIKit

final class IconsViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let iconsCollectionViewCellIdentifier = "IconsCollectionViewCell"

    private let icons = CharcoalAsset.Images.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    private func setupCollectionView() {
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(
                nibName: iconsCollectionViewCellIdentifier,
                bundle: .module
            ),
            forCellWithReuseIdentifier: iconsCollectionViewCellIdentifier
        )
    }
}

// MARK: - UICollectionViewDataSource

extension IconsViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return icons.count
    }
}

// MARK: - UICollectionViewDelegate

extension IconsViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        // swiftlint:disable line_length
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: iconsCollectionViewCellIdentifier, for: indexPath) as? IconsCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: icons[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout

extension IconsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 4
        let marginBetweenCells: CGFloat = 8
        let marginFromTheEdge: CGFloat = 16
        // swiftlint:disable line_length
        let width = (view.frame.width - marginFromTheEdge * 2 - marginBetweenCells * (numberOfColumns - 1)) / numberOfColumns
        let colorNameLabelHeight: CGFloat = ColorsCollectionViewCell.colorNameLabelHeight()
        return CGSize(width: width, height: width + colorNameLabelHeight)
    }

    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        insetForSectionAt _: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
    }

    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        minimumLineSpacingForSectionAt _: Int
    ) -> CGFloat {
        return 8
    }

    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt _: Int
    ) -> CGFloat {
        return 0
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = IconsViewController()
    return viewController
}
