import UIKit

extension UIColor {
    public static func charcoal(_ charcoalColor: CharcoalAsset.ColorPaletteGenerated) -> UIColor {
        UIColor { traitCollection in
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
