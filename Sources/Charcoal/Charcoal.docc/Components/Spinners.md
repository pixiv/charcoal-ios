# Charocal Spinners

Charcoal spinners are designed to display a loading state.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: icon, 
        source: "charcoal-icon", 
        alt: "A technology icon representing the Charcoal framework.")
}

## Usage

### SwiftUI Spinners

```swift
VStack {}
    .charcoalSpinner(isLoading: $isLoading)
```

### UIKit Spinners

```swift
CharcoalSpinner.show(spinnerSize: .medium, transparentBackground: true, interactionPassthrough: true, on: view)
```

## Topics

### Creating SwiftUI Spinners

- ``SwiftUI/View/charcoalSpinner(isPresenting:spinnerSize:transparentBackground:interactionPassthrough:)``

### Creating UIKit Typographies

- ``CharcoalSpinner/show(spinnerSize:transparentBackground:interactionPassthrough:on:)``
- ``CharcoalSpinner/dismiss()``
