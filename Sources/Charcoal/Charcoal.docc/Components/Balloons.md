# Charocal Balloons

Charcoal Balloons are designed to show a message in a balloon-shaped container.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: icon, 
        source: "charcoal-icon", 
        alt: "A technology icon representing the Charcoal framework.")
}

## Usage

### SwiftUI

```swift
VStack {}
    .charcoalBalloon(isPresenting: $isPresenting, text: "Hello", dismissAfter: 2)
```

## Topics

### Creating SwiftUI Balloons
- ``SwiftUI/View/charcoalBalloon(isPresenting:text:dismissAfter:action:)``
