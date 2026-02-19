# charcoal-ios ― PIXIV Design System

## Usage

### SwiftUI

```swift
Text("Hello")
  .charcoalTypography20Bold()

Button("OK") {}
  .charcoalPrimaryButton(size: .medium)
```

### UIKit

Storyboard とコードから利用可能です。

```swift
let label = CharcoalTypography20()
label.isBold = true
label.text = "Hello"

let button = CharcoalPrimaryMButton()
button.setTitle("OK", for: .normal)
```

### Dynamic Type

charcoal-ios はデフォルトで Dynamic Type をサポートしています。この機能を無効にしたい場合は、以下の手順を参照してください。

#### SwiftUI

`.environment(.sizeCategory, .large)` を使用して Dynamic Type レベルを固定します。

```swift
Button("Default Button M") {}
    .charcoalDefaultButton(size: .medium)
    .environment(\.sizeCategory, .large)
```

#### UIKit
`CharcoalConfig.configUIKit.fixedSizeCategory` を使用して Dynamic Type レベルを固定します。

```swift
CharcoalConfig.configUIKit.fixedSizeCategory = .large
```

デフォルトでは、 CharcoalUIKit は UITraitCollection の preferredContentSizeCategory に従うので、UITraitCollection を変更することで SizeCategory を指定できます。

```swift
let trait = UITraitCollection(preferredContentSizeCategory: .large)

setOverrideTraitCollection(trait, forChild: viewController)
```



## Installation

Swift Package Manager を使ってライブラリをインストールすることができます。

```swift
dependencies: [
  .package(url: "https://github.com/pixiv/charcoal-ios", .upToNextMajor(from: "1.0.0"))
]
```

## Requirements

- iOS 15+
- macOS 12+

## Documentation

[Documentation](https://pixiv.github.io/charcoal-ios/documentation/charcoal/)

## Development

### Configuration

Xcode configuration `DebugMaxDeploymentTarget` は、自動化テストの際に `IPHONEOS_DEPLOYMENT_TARGET` を指定するためだけに使用されます。

### SwiftGen

#### Generate Assets

Run `swiftgen` command in the `charcoal-ios` project folder.

```
swift run --package-path BuildTools swiftgen
```

### SwiftLint

```
swift run --package-path BuildTools swiftlint
```

### Code Format

```
swift run -c release --package-path BuildTools swiftformat .
```
