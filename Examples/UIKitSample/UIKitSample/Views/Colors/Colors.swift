import Charcoal
import UIKit

final class ColorsViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    private let colorsCollectionViewCellIdentifier = "ColorsCollectionViewCell"

    private let colors = [
        CharcoalAsset.ColorPaletteGenerated.background1,
        CharcoalAsset.ColorPaletteGenerated.background2,
        CharcoalAsset.ColorPaletteGenerated.brand,
        CharcoalAsset.ColorPaletteGenerated.border,
        CharcoalAsset.ColorPaletteGenerated.link1,
        CharcoalAsset.ColorPaletteGenerated.link2,
        CharcoalAsset.ColorPaletteGenerated.text1,
        CharcoalAsset.ColorPaletteGenerated.text2,
        CharcoalAsset.ColorPaletteGenerated.text3,
        CharcoalAsset.ColorPaletteGenerated.text4,
        CharcoalAsset.ColorPaletteGenerated.text5,
        CharcoalAsset.ColorPaletteGenerated.icon6,
        CharcoalAsset.ColorPaletteGenerated.assertive,
        CharcoalAsset.ColorPaletteGenerated.callToAction0,
        CharcoalAsset.ColorPaletteGenerated.callToAction100,
        CharcoalAsset.ColorPaletteGenerated.success,
        CharcoalAsset.ColorPaletteGenerated.warning,
        CharcoalAsset.ColorPaletteGenerated.updatedItem,
        CharcoalAsset.ColorPaletteGenerated.surface1,
        CharcoalAsset.ColorPaletteGenerated.surface2,
        CharcoalAsset.ColorPaletteGenerated.surface3,
        CharcoalAsset.ColorPaletteGenerated.surface4,
        CharcoalAsset.ColorPaletteGenerated.surface50,
        CharcoalAsset.ColorPaletteGenerated.surface5100,
        CharcoalAsset.ColorPaletteGenerated.surface6,
        CharcoalAsset.ColorPaletteGenerated.surface7,
        CharcoalAsset.ColorPaletteGenerated.surface8,
        CharcoalAsset.ColorPaletteGenerated.surface9,
        CharcoalAsset.ColorPaletteGenerated.surface10
    ].map { $0.color }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(
                nibName: colorsCollectionViewCellIdentifier,
                bundle: nil
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
