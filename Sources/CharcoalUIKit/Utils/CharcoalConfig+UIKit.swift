import UIKit

public extension CharcoalConfig {
    static var configUIKit: UIKitConfigs = .default

    struct UIKitConfigs {
        public static let `default` = UIKitConfigs(fixedSizeCategory: nil)
        public var fixedSizeCategory: UIContentSizeCategory?
    }
}
