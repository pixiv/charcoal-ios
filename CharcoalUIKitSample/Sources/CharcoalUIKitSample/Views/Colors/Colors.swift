import Charcoal
import UIKit

private extension CharcoalAsset.ColorPaletteGenerated {
    var description: String {
        return String(String(reflecting: self).split(separator: ".").last ?? "")
    }
}

final class ColorsViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let colors = CharcoalAsset.ColorPaletteGenerated.allCases.map {
        (name: $0.description, color: $0.color)
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
        collectionView.register(ColorSwatchCollectionViewCell.self, forCellWithReuseIdentifier: ColorSwatchCollectionViewCell.reuseIdentifier)
    }
}

// MARK: - UICollectionViewDataSource

extension ColorsViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return colors.count
    }
}

// MARK: - UICollectionViewDelegate

extension ColorsViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorSwatchCollectionViewCell.reuseIdentifier, for: indexPath) as? ColorSwatchCollectionViewCell else {
            fatalError()
        }
        let item = colors[indexPath.item]
        cell.configure(color: item.color)
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        CharcoalTooltip.show(text: colors[indexPath.item].name, anchorView: cell)
    }
}

// MARK: - UICollectionViewFlowLayout

extension ColorsViewController: UICollectionViewDelegateFlowLayout {
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
    return ColorsViewController()
}
