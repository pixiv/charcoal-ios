import UIKit

extension UILabel {
    func setupFont(fontSize: CGFloat, weight: UIFont.Weight, isMono: Bool) {
        if isMono {
            let systemFont: UIFont = .monospacedSystemFont(ofSize: fontSize, weight: weight)
            let fontFallbacks = CharcoalConfig.GlobalSettings.fontFallback.compactMap { createFallbackFont(name: $0, weight: weight) }
            let fallbackableFont = systemFont.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList: fontFallbacks])
            font = UIFont(descriptor: fallbackableFont, size: fontSize).scaledFont
        } else {
            let systemFont: UIFont = .systemFont(ofSize: fontSize, weight: weight)
            let fontFallbacks = CharcoalConfig.GlobalSettings.fontFallback.compactMap { createFallbackFont(name: $0, weight: weight) }
            let fallbackableFont = systemFont.fontDescriptor.addingAttributes([UIFontDescriptor.AttributeName.cascadeList: fontFallbacks])
            font = UIFont(descriptor: fallbackableFont, size: fontSize).scaledFont
        }
    }

    func setupLineHeight(lineHeight: CGFloat) {
        guard numberOfLines == 0, let text = text else {
            return
        }
        let paragraphStyle = NSMutableParagraphStyle()
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: attributedText.length)

        paragraphStyle.lineSpacing = lineHeight - font.lineHeight
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        self.attributedText = attributedText
    }

    private func createFallbackFont(name: String, weight: UIFont.Weight) -> UIFontDescriptor {
        var attributes: [UIFontDescriptor.AttributeName: Any] = [:]
        var traits: [UIFontDescriptor.TraitKey: Any] = [:]
        traits[.weight] = weight
        attributes[UIFontDescriptor.AttributeName.name] = nil
        attributes[UIFontDescriptor.AttributeName.family] = name
        attributes[UIFontDescriptor.AttributeName.traits] = traits
        return UIFontDescriptor(fontAttributes: attributes)
    }
}
