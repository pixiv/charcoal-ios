import CharcoalShared
import UIKit

class TooltipTableViewCell: UITableViewCell {
    static let identifier = "TooltipCell"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let leadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let accessoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.addSubview(leadingImageView)
        contentView.addSubview(accessoryImageView)

        NSLayoutConstraint.activate([
            leadingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            leadingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            accessoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            accessoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configCell(type: TooltipTitles) {
        titleLabel.text = type.rawValue
        switch type {
        case .leading:
            leadingImageView.image = CharcoalAsset.Images.info24.image
        case .trailing:
            accessoryImageView.image = CharcoalAsset.Images.info24.image
        case .bottom:
            break
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        leadingImageView.image = nil
    }
}
