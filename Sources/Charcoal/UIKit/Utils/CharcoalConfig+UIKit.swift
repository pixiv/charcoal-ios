import UIKit

extension CharcoalConfig {
    public static var configUIKit: UIKitConfigs = UIKitConfigs.default
    
    public struct UIKitConfigs {
        public static let `default` = UIKitConfigs(fixedSizeCategory: nil)
        public var fixedSizeCategory: UIContentSizeCategory?
    }
}
