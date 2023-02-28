import UIKit

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { context in
            self.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }

    func blend(overlay: UIColor) -> UIColor {
        var srcR: CGFloat = 0
        var srcG: CGFloat = 0
        var srcB: CGFloat = 0
        var srcA: CGFloat = 0

        var dstR: CGFloat = 0
        var dstG: CGFloat = 0
        var dstB: CGFloat = 0
        var dstA: CGFloat = 0

        overlay.getRed(&srcR, green: &srcG, blue: &srcB, alpha: &srcA)
        getRed(&dstR, green: &dstG, blue: &dstB, alpha: &dstA)

        // swiftlint:disable identifier_name
        return {
            let a = srcA + dstA * (1 - srcA)
            guard a != 0 else {
                return .clear
            }
            let r = (srcR * srcA + dstR * dstA * (1 - srcA)) / a
            let g = (srcG * srcA + dstG * dstA * (1 - srcA)) / a
            let b = (srcB * srcA + dstB * dstA * (1 - srcA)) / a

            return UIColor(red: r, green: g, blue: b, alpha: a)
        }()
    }
}
