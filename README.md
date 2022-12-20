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
  .package(name: "Charcoal", url: "https://github.com/pixiv/charcoal-ios", .upToNextMajor(from: "0.1.0"))
]
```

## Requirements

- iOS 11+
- macOS 11+

## Documentation

[Documentation](https://pixiv.github.io/charcoal-ios/)

## Development

### Code Format

```
swift run -c release --package-path BuildTools swiftformat .
```
