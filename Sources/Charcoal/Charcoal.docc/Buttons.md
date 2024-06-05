# Charocal Buttons

Charcoal buttons are designed to be used in a variety of contexts and are highly customizable.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: icon, 
        source: "charcoal-icon", 
        alt: "A technology icon representing the Charcoal framework.")
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

- ``SwiftUI/View/charcoalPrimaryButton(size:isFixed:primaryColor:)``
- ``SwiftUI/View/charcoalDefaultButton(size:isFixed:)``
- ``SwiftUI/View/charcoalDefaultOverlayButton(size:isFixed:)``
- ``SwiftUI/View/charcoalLinkButton()``
- ``SwiftUI/View/charcoalNavigationButton(size:isFixed:)``

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
