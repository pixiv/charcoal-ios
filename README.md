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

- iOS 13+
- macOS 11+

## Documentation

[Documentation](https://pixiv.github.io/charcoal-ios/)

## Development

### SwiftGen

#### Install SwiftGen

```
brew install swiftgen
```

#### Generate Assets

Run `swiftgen` command in the `charcoal-ios` project folder.

### SwiftLint

```
brew install swiftlint
```

### Code Format

```
swift run -c release --package-path BuildTools swiftformat .
```
