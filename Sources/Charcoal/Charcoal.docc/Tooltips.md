# Charocal Tooltips

Charcoal Tooltips can be used to provide additional information about an element when the user click on it.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: icon, 
        source: "charcoal-icon", 
        alt: "A technology icon representing the Charcoal framework.")
}

## Usage

### SwiftUI Tooltips

```swift
Button("Primary Button") {}
    .charcoalTooltip(isPresenting: $isPresenting, text: "This is a tooltip", dismissAfter: 2)
```

### UIKit Tooltips

```swift
CharcoalTooltip.show(text: "This is a tooltip", anchorView: view)
```

## Topics

### Creating SwiftUI Tooltips

- ``SwiftUI/View``
- ``SwiftUI/View/charcoalTooltip(isPresenting:text:dismissAfter:)``

### Creating UIKit Tooltips

- ``CharcoalTooltip``
- ``CharcoalTooltip/show(text:anchorView:on:)``
- ``CharcoalTooltip/dismiss(id:)``
