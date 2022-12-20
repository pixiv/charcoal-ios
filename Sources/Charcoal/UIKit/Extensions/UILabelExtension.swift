import UIKit

extension UILabel {
    func setupFont(fontSize: CGFloat, isBold: Bool, isMono: Bool) {
        if isBold {
            if #available(iOS 13.0, *), isMono {
                font = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .bold)
            } else {
                font = UIFont.boldSystemFont(ofSize: fontSize)
            }
        } else {
            if #available(iOS 13.0, *), isMono {
                font = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .regular)
            } else {
                font = UIFont.systemFont(ofSize: fontSize)
            }
        }
    }

    func setupLineHeight(lineHeight: CGFloat) {
        guard numberOfLines == 0, let text = text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attributedText.length)

        paragraphStyle.lineSpacing = lineHeight - font.lineHeight
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        self.attributedText = attributedText
    }
}
