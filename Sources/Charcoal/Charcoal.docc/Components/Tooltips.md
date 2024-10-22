# Charocal Tooltips

Charcoal Tooltips can be used to provide additional information about an element when the user click on it.

@Metadata {
    @PageImage(
        purpose: card, 
        source: "Tooltips", 
        alt: "Charcoal Tooltips can be used to provide additional information about an element when the user click on it.")
}

## Usage

### SwiftUI Tooltips

```swift
VStack {}
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
