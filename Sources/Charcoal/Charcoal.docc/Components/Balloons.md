# Charocal Balloons

Charcoal Balloons are designed to show a message in a balloon-shaped container.

@Metadata {
    @PageImage(
        purpose: card, 
        source: "Balloon", 
        alt: "Charcoal Balloons are designed to show a message in a balloon-shaped container.")
}


## Usage

### SwiftUI

```swift
VStack {}
    .charcoalBalloon(isPresenting: $isPresenting, text: "Hello", dismissAfter: 2)
```

## Topics

### Creating SwiftUI Balloons

- ``SwiftUICore/View/charcoalBalloon(isPresenting:text:dismissAfter:action:)``

### Creating UIKit Balloons

- ``CharcoalBalloon/show(text:anchorView:interactionMode:spacingToScreen:gap:on:)``
