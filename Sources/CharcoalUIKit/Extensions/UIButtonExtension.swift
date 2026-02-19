import UIKit

extension UIButton {
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
            button.configuration?.attributedTitle?.font = .systemFont(ofSize: UIFontMetrics.default.charcoalScaledValue(for: 14), weight: .bold)
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

    func generateUIButtonConfiguration(
        textColor: UIColor,
        pressedTextColor: UIColor,
        enabledBackgroundColor: UIColor
    ) -> UIButton.Configuration {
        let configuration = UIButton.Configuration.filled()

        configurationUpdateHandler = { button in
            button.configuration?.attributedTitle?.font = .systemFont(ofSize: UIFontMetrics.default.charcoalScaledValue(for: 14), weight: .bold)
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
}
