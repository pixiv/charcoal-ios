import UIKit

extension UILabel {
    func setupFont(fontSize: CGFloat, isBold: Bool, isMono: Bool) {
        if isBold {
            if isMono {
                font = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .bold).scaledFont
            } else {
                font = UIFont.systemFont(ofSize: fontSize, weight: .bold).scaledFont
            }
        } else {
            if isMono {
                font = UIFont.monospacedSystemFont(ofSize: fontSize, weight: .regular).scaledFont
            } else {
                font = UIFont.systemFont(ofSize: fontSize).scaledFont
            }
        }
    }

    func setupLineHeight(lineHeight: CGFloat) {
        guard let text else {
            return
        }
        let paragraphStyle = NSMutableParagraphStyle()
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attributedText.length)

        paragraphStyle.lineSpacing = lineHeight - font.lineHeight
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        self.attributedText = attributedText
    }
}
