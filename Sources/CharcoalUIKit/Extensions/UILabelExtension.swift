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

    func setupParagraphStyle(lineHeight: CGFloat) {
        guard let text else {
            return
        }

        let paragraphStyle = makeMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight - font.lineHeight

        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        self.attributedText = attributedText
    }

    private func makeMutableParagraphStyle() -> NSMutableParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        paragraphStyle.lineBreakStrategy = lineBreakStrategy
        paragraphStyle.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        paragraphStyle.alignment = textAlignment

        return paragraphStyle
    }
}
