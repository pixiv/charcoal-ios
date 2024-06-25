import UIKit

extension String {
    // swiftformat:disable redundantSelf
    func calculateFrame(font: UIFont, maxWidth: CGFloat) -> CGSize {
        let size = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        let attributes = [NSAttributedString.Key.font: font]
        let rect = self.boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return rect.size
    }
}
