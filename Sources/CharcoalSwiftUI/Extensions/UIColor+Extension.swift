import UIKit

extension UIColor {
    public convenience init(charcoalColor: CharcoalAsset.ColorPaletteGenerated) {
        self.init { traitCollection in
            charcoalColor.colorAsset.color(compatibleWith: traitCollection)
        }
    }

    func imageWithColor(width: Int, height: Int) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
