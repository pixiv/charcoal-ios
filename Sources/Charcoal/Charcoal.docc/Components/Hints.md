# Charocal Hints

Charcoal Hints are designed to display in page hints and tips to the user.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: card, 
        source: "Hints", 
        alt: "Charcoal Hints are designed to display in page hints and tips to the user.")
}

## Usage

### SwiftUI Hints

```swift
CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting) {
    Button(action: {
        isPresenting = false
    }) {
        Text("Button")
    }
}
```

### UIKit Hints

```swift
let hintView = CharcoalHintView(text: "ブックマークしました", action: CharcoalAction(title: "編集", actionCallback: {
    print("編集 taped")
}))
```

## Topics

### Creating SwiftUI Hints

- ``CharcoalHint``


### Creating UIKit Hints

- ``CharcoalHintView``
