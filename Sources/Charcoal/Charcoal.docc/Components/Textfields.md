# Charocal TextFields

Charcoal Textfields are designed to be used in a variety of contexts and are highly customizable.

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
    @PageImage(
        purpose: card, 
        source: "TextFields", 
        alt: "Charcoal Textfields are designed to be used in a variety of contexts and are highly customizable.")
}

## Usage

### SwiftUI

```swift
TextField("", text: .constant("Text"))
    .charcoalTextField(
        label: .constant("Label"),
        countLabel: .constant("0/10"),
        assistiveText: .constant("Assistive text")
    )
 ```

### UIKit

```swift
let textField = CharcoalTextField()
```

## Topics

### Creating SwiftUI TextFields

- ``SwiftUI/View/charcoalTextField(label:countLabel:assistiveText:hasError:)``

### Creating UIKit TextFields

- ``CharcoalTextField``
