# Charocal Dynamic Type

CharcoalはデフォルトでDynamic Typeをサポートしています。この機能を無効にしたい場合は、以下の手順をご参照ください。

@Metadata {
    @PageImage(
        purpose: icon, 
        source: "charcoal-icon", 
        alt: "A technology icon representing the Charcoal framework.")
}

## Usage

charcoal-ios はデフォルトで Dynamic Type をサポートしています。この機能を無効にしたい場合は、以下の手順をご参照ください。

#### SwiftUI

`.environment(.sizeCategory, .large)` を使用して Dynamic Type レベルを固定します。

```swift
Button("Default Button M") {}
    .charcoalDefault(size: .medium)
    .environment(\.sizeCategory, .large)
```

#### UIKit
デフォルトでは、CharocalUIKitはUITraitCollectionのpreferredContentSizeCategory属性に従いますので、UITraitCollectionを変更することでSizeCategoryを指定できます。

```swift
let trait = UITraitCollection(preferredContentSizeCategory: .large)

setOverrideTraitCollection(trait, forChild: viewController)
```

その他にも、`CharcoalConfig.configUIKit.fixedSizeCategory` を使用して Dynamic Type レベルを固定します。

```swift
CharcoalConfig.configUIKit.fixedSizeCategory = .large
```
