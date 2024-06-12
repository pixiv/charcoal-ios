# Charocal Toasts

Charcoal Toasts can be used to display a message and Snackbar to the user.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: card, 
        source: "Toasts", 
        alt: "Charcoal Toasts can be used to display a message and Snackbar to the user.")
}

## Usage

### SwiftUI Toasts

```swift
VStack {}
    .charcoalToast(isPresenting: $isPresenting, text: "Hello", dismissAfter: 2)
```

### SwiftUI Snackbars

```swift
VStack {}
    .charcoalSnackbar(isPresenting: $isPresenting, text: "Hello", dismissAfter: 2)
```

### UIKit Toasts

```swift
CharcoalToast.show(text: "Hello", on: view)
```

### UIKit Snackbars

```swift
CharcoalSnackBar.show(text: "Hello", on: view)
```

## Topics

### Creating SwiftUI Toasts

- ``SwiftUI/View/charcoalToast(isPresenting:screenEdge:screenEdgeSpacing:text:dismissAfter:appearance:animationConfiguration:action:)``

### Creating SwiftUI Snackbars

- ``SwiftUI/View/charcoalSnackBar(isPresenting:screenEdge:screenEdgeSpacing:text:thumbnailImage:dismissAfter:action:)``


### Creating UIKit Toasts

- ``CharcoalToast``

### Creating UIKit Snackbars

- ``CharcoalSnackBar``
