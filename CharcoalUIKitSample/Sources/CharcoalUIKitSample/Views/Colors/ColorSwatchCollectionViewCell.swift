import UIKit

final class ColorSwatchCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "ColorSwatchCollectionViewCell"

    private let swatchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.08).cgColor
        view.layer.borderWidth = 1
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(swatchView)
        NSLayoutConstraint.activate([
            swatchView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            swatchView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            swatchView.topAnchor.constraint(equalTo: contentView.topAnchor),
            swatchView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(color: UIColor) {
        swatchView.backgroundColor = color
    }
}
