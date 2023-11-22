import UIKit

extension UIButton {
    @available(iOS 15.0, *)
    func generateUIButtonConfiguration(
        textColor: UIColor,
        enabledBackgroundColor: UIColor,
        pressedOverlayColor: UIColor, size: CharcoalButtonSize
    ) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        let pressedTextColor = textColor.blend(overlay: pressedOverlayColor)
        let pressedBackgroundColor = enabledBackgroundColor.blend(overlay: pressedOverlayColor)

        // swiftlint:disable line_length
        configuration.contentInsets = size == .medium ? .init(top: 11.5, leading: 24, bottom: 11.5, trailing: 24) : .init(top: 7.5, leading: 16, bottom: 7.5, trailing: 16)

        configurationUpdateHandler = { button in
            button.configuration?.attributedTitle?.font = .systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .bold)
            switch button.state {
            case .highlighted:
                button.configuration?.attributedTitle?.foregroundColor = pressedTextColor
                button.configuration?.background.backgroundColor = pressedBackgroundColor
            case .disabled:
                button.configuration?.attributedTitle?.foregroundColor = textColor
                button.configuration?.background.backgroundColor = pressedBackgroundColor
            default:
                button.configuration?.attributedTitle?.foregroundColor = textColor
                button.configuration?.background.backgroundColor = enabledBackgroundColor
            }
        }

        return configuration
    }

    @available(iOS 15.0, *)
    func generateUIButtonConfiguration(
        textColor: UIColor,
        pressedTextColor: UIColor,
        enabledBackgroundColor: UIColor
    ) -> UIButton.Configuration {
        let configuration = UIButton.Configuration.filled()

        configurationUpdateHandler = { button in
            button.configuration?.attributedTitle?.font = .systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .bold)
            switch button.state {
            case .highlighted:
                button.configuration?.attributedTitle?.foregroundColor = pressedTextColor
                button.configuration?.background.backgroundColor = enabledBackgroundColor
            case .disabled:
                button.configuration?.attributedTitle?.foregroundColor = textColor
                button.configuration?.background.backgroundColor = enabledBackgroundColor
            default:
                button.configuration?.attributedTitle?.foregroundColor = textColor
                button.configuration?.background.backgroundColor = enabledBackgroundColor
            }
        }

        return configuration
    }

    func setupButtonStyle(
        textColor: UIColor,
        enabledBackgroundColor: UIColor,
        pressedOverlayColor: UIColor,
        size: CharcoalButtonSize
    ) {
        let pressedTextColor = textColor.blend(overlay: pressedOverlayColor)
        let pressedBackgroundColor = enabledBackgroundColor.blend(overlay: pressedOverlayColor)

        setBackgroundImage(enabledBackgroundColor.image(), for: .normal)
        setBackgroundImage(pressedBackgroundColor.image(), for: .highlighted)
        setBackgroundImage(enabledBackgroundColor.image(), for: .disabled)
        setTitleColor(textColor, for: .normal)
        setTitleColor(pressedTextColor, for: .highlighted)

        isExclusiveTouch = true
        titleLabel?.font = .systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .bold)
        // swiftlint:disable line_length
        contentEdgeInsets = size == .medium ? UIEdgeInsets(top: 11.5, left: 24, bottom: 11.5, right: 24) : UIEdgeInsets(top: 7.5, left: 16, bottom: 7.5, right: 16)
    }

    func setupButtonStyle(
        textColor: UIColor,
        pressedTextColor: UIColor,
        enabledBackgroundColor: UIColor
    ) {
        setBackgroundImage(enabledBackgroundColor.image(), for: .normal)
        setBackgroundImage(enabledBackgroundColor.image(), for: .highlighted)
        setBackgroundImage(enabledBackgroundColor.image(), for: .disabled)
        setTitleColor(textColor, for: .normal)
        setTitleColor(pressedTextColor, for: .highlighted)

        isExclusiveTouch = true
        titleLabel?.font = .systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .bold)
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
    }
}
