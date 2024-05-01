import UIKit

extension String {
    func calculateFrame(font: UIFont, maxWidth: CGFloat) -> CGSize {
        let size = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        let attributes = [NSAttributedString.Key.font: font]
        let rect = boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return rect.size
    }
}
