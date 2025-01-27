import SwiftUI

public extension CharcoalConfig {
    class GlobalSettings: ObservableObject {
        @Published public var fontFallback: [String]
        @Published public var monoFontFallback: [String]

        public init(fontFallback: [String] = ["Hiragino Sans", "PingFang SC"], monoFontFallback: [String] = ["Menlo"]) {
            _fontFallback = Published(wrappedValue: fontFallback)
            _monoFontFallback = Published(wrappedValue: monoFontFallback)
        }
    }
}
