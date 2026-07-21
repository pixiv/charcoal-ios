import Charcoal
import UIKit

final class IconsViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let icons = CharcoalAsset.Images.allCases

    private func iconPointSize(for name: String) -> CGFloat {
        if name.hasSuffix("24") {
            return 24
        }
        if name.hasSuffix("20") {
            return 20
        }
        return 16
    }

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
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(IconSwatchCollectionViewCell.self, forCellWithReuseIdentifier: IconSwatchCollectionViewCell.reuseIdentifier)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconSwatchCollectionViewCell.reuseIdentifier, for: indexPath) as? IconSwatchCollectionViewCell else {
            fatalError()
        }
        let icon = icons[indexPath.item]
        cell.configure(image: icon.image, pointSize: iconPointSize(for: icon.description))
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        CharcoalTooltip.show(text: icons[indexPath.item].description, anchorView: cell)
    }
}

// MARK: - UICollectionViewFlowLayout

extension IconsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let marginBetweenCells: CGFloat = 8
        let marginFromTheEdge: CGFloat = 8
        let minimumSize: CGFloat = 32
        let availableWidth = view.frame.width - marginFromTheEdge * 2
        let numberOfColumns = max(1, floor((availableWidth + marginBetweenCells) / (minimumSize + marginBetweenCells)))
        let width = (view.frame.width - marginFromTheEdge * 2 - marginBetweenCells * (numberOfColumns - 1)) / numberOfColumns
        return CGSize(width: width, height: width)
    }

    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        insetForSectionAt _: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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
        return 8
    }
}

@available(iOS 17.0, *)
#Preview {
    return IconsViewController()
}
