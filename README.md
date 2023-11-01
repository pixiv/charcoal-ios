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

Storyboardとコードから利用可能です。

```swift
let label = CharcoalTypography20()
label.isBold = true
label.text = "Hello"

let buttton = CharcoalPrimaryMButton()
button.setTitle("OK", for: .normal)
```

## Installation
Swift Package Managerを使ってライブラリをインストールすることができます。

```swift
dependencies: [
  .package(url: "https://github.com/pixiv/charcoal-ios", .upToNextMajor(from: "1.0.0"))
]
```

## Requirements

- iOS 14+
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
