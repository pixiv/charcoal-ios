import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var palletView: UIView!
    @IBOutlet var colorNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupPalletView()
        setupColorNameLabel()
    }

    private func setupPalletView() {
        palletView.layer.cornerRadius = 8.0
        palletView.layer.masksToBounds = true
    }

    private func setupColorNameLabel() {
        colorNameLabel.adjustsFontSizeToFitWidth = true
        colorNameLabel.minimumScaleFactor = 0.3
    }

    static func colorNameLabelHeight() -> CGFloat {
        return 32
    }

    func configure(with color: UIColor, name: String) {
        palletView.backgroundColor = color
        colorNameLabel.text = name
    }
}
