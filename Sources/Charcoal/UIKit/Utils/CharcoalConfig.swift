import UIKit

public struct CharcoalConfig {
    public static var configUIKit: UIKitConfigs = UIKitConfigs.default
}

extension CharcoalConfig {
    public struct UIKitConfigs {
        public static let `default` = UIKitConfigs(fixedSizeCategory: nil)
        public var fixedSizeCategory: UIContentSizeCategory?
    }
}
