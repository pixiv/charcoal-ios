import Charcoal
import UIKit

final class ColorsViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let colorsCollectionViewCellIdentifier = "ColorsCollectionViewCell"

    private let colors = CharcoalAsset.ColorPaletteGenerated.allCases.map({ $0.color })

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
                nibName: colorsCollectionViewCellIdentifier,
                bundle: .module
            ),
            forCellWithReuseIdentifier: colorsCollectionViewCellIdentifier
        )
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
        // swiftlint:disable line_length
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorsCollectionViewCellIdentifier, for: indexPath) as? ColorsCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: colors[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout

extension ColorsViewController: UICollectionViewDelegateFlowLayout {
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
    let viewController = ColorsViewController()
    return viewController
}
