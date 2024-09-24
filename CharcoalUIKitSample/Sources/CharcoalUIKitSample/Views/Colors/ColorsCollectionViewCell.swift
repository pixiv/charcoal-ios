import UIKit
import Charcoal

class ColorsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var palletView: UIView!
    @IBOutlet var colorNameLabel: UILabel!
    
    var color: CharcoalFoundation.Colors?

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
    }

    static func colorNameLabelHeight() -> CGFloat {
        return 32
    }

    func configure(with charcoalColor: CharcoalFoundation.Colors) {
        color = charcoalColor
        palletView.backgroundColor = charcoalColor.value
        colorNameLabel.text = String(describing: charcoalColor)
    }
}
