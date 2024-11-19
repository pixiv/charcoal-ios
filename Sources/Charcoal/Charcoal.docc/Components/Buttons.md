# Charocal Buttons

Charcoal Buttons are designed to be used in a variety of contexts and are highly customizable.

@Metadata {
    @PageImage(
        purpose: card, 
        source: "Buttons", 
        alt: "Charcoal buttons are designed to be used in a variety of contexts and are highly customizable.")
}

## Usage

### SwiftUI Buttons

```swift
Button("Primary Button") {}
    .charcoalPrimaryButton()
 ```

### UIKit Buttons

```swift
let button = CharcoalPrimaryMButton()
```

## Topics

### Creating SwiftUI buttons

- ``SwiftUICore/View/charcoalPrimaryButton(size:isFixed:primaryColor:)``
- ``SwiftUICore/View/charcoalDefaultButton(size:isFixed:)``
- ``SwiftUICore/View/charcoalDefaultOverlayButton(size:isFixed:)``
- ``SwiftUICore/View/charcoalLinkButton()``
- ``SwiftUICore/View/charcoalNavigationButton(size:isFixed:)``

### Creating UIKit buttons

- ``CharcoalDefaultMButton``
- ``CharcoalDefaultSButton``
- ``CharcoalDefaultOverlayMButton``
- ``CharcoalDefaultOverlaySButton``
- ``CharcoalLinkButton``
- ``CharcoalNavigationMButton``
- ``CharcoalNavigationSButton``
- ``CharcoalPrimaryMButton``
- ``CharcoalPrimarySButton``
- ``CharcoalSwitchingButton``
