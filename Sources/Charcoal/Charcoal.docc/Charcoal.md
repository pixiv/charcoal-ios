# ``Charcoal``

PIXIV Design System

@Metadata {
    @PageImage(
        purpose: icon, 
        source: "charcoal-icon", 
        alt: "A technology icon representing the Charcoal framework.")
}

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

let button = CharcoalPrimaryMButton()
button.setTitle("OK", for: .normal)
```

### Installation

Swift Package Managerを使ってライブラリをインストールすることができます。

```swift
dependencies: [
  .package(url: "https://github.com/pixiv/charcoal-ios", .upToNextMajor(from: "1.0.0"))
]
```
