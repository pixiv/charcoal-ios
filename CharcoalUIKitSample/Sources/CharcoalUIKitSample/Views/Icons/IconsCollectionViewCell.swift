import UIKit
import Charcoal

class IconsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var palletView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
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

    func configure(with icon: CharcoalAsset.Images) {
        iconImageView.image = icon.image
        colorNameLabel.text = icon.description
    }
}

private extension UIColor {
    var name: String? {
        let string = String(describing: self).dropLast()
        guard let nameRange = string.range(of: "name = ") else {
            return nil
        }
        return String(string[nameRange.upperBound ..< string.endIndex]).components(separatedBy: "/").last
    }
}
