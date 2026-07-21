import Charcoal
import UIKit

final class ColorsV2ListViewController: UIViewController {
    enum Kind {
        case applied
        case primitive

        var title: String {
            switch self {
            case .applied:
                return "Applied"
            case .primitive:
                return "Primitive"
            }
        }

        var useTwoLevelPrefix: Bool {
            switch self {
            case .applied:
                return false
            case .primitive:
                return true
            }
        }

        var colorAssets: [ColorAsset] {
            let all = CharcoalAsset.ColorPaletteV2Generated.allColorAssets
            switch self {
            case .applied:
                return all.filter { asset in
                    !asset.name.hasPrefix("light/") && !asset.name.hasPrefix("dark/")
                }
            case .primitive:
                return all.filter { asset in
                    asset.name.hasPrefix("light/") || asset.name.hasPrefix("dark/")
                }
            }
        }
    }

    private struct ColorSection {
        let title: String
        let items: [(name: String, color: UIColor)]
    }

    private let kind: Kind

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var sections: [ColorSection] = {
        let allColors = kind.colorAssets.map {
            (name: $0.name, color: $0.color)
        }
        let grouped = Dictionary(grouping: allColors) { item -> String in
            let components = item.name.split(separator: "/").map(String.init)
            if kind.useTwoLevelPrefix, components.count >= 2 {
                return "\(components[0])/\(components[1])"
            }
            return components.first ?? item.name
        }
        return grouped
            .map { key, value in
                ColorSection(title: key, items: value.sorted { $0.name < $1.name })
            }
            .sorted { $0.title < $1.title }
    }()

    init(kind: Kind) {
        self.kind = kind
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = kind.title
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
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ColorSwatchCollectionViewCell.self, forCellWithReuseIdentifier: ColorSwatchCollectionViewCell.reuseIdentifier)
        collectionView.register(
            ColorSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: ColorSectionHeaderView.reuseIdentifier
        )
    }
}

extension ColorsV2ListViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
}

extension ColorsV2ListViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorSwatchCollectionViewCell.reuseIdentifier, for: indexPath) as? ColorSwatchCollectionViewCell else {
            fatalError()
        }
        let item = sections[indexPath.section].items[indexPath.item]
        cell.configure(color: item.color)
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        CharcoalTooltip.show(text: sections[indexPath.section].items[indexPath.item].name, anchorView: cell)
    }
}

extension ColorsV2ListViewController: UICollectionViewDelegateFlowLayout {
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
        return UIEdgeInsets(top: 4, left: 8, bottom: 8, right: 8)
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

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ColorSectionHeaderView.reuseIdentifier,
                for: indexPath
            ) as? ColorSectionHeaderView else {
                fatalError()
            }
            view.configure(title: sections[indexPath.section].title)
            return view
        }
        return UICollectionReusableView()
    }

    func collectionView(
        _: UICollectionView,
        layout _: UICollectionViewLayout,
        referenceSizeForHeaderInSection _: Int
    ) -> CGSize {
        return CGSize(width: view.frame.width, height: 20)
    }
}
