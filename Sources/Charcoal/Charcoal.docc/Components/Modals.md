# Charocal Modals

Charcoal Modals are designed to show a message in a modal container.

@Metadata {
    @PageImage(
        purpose: card, 
        source: "Modals", 
        alt: "Charcoal Modals are designed to show a message in a modal container.")
}

## Usage

### SwiftUI

```swift
.charcoalModal(
    title: "Title",
    style: .center,
    isPresented: $isPresented,
    actions: {
        Button(action: {
            isPresented = false
        }, label: {
            Text("OK").frame(maxWidth: .infinity)
        }).charcoalPrimaryButton(size: .medium)

        Button(action: {
            isPresented = false
        }, label: {
            Text("Dismiss").frame(maxWidth: .infinity)
        }).charcoalDefault(size: .medium)
    }
) {
   Text("Hello This is a center dialog from Charcoal")
}

```

## Topics

### Creating SwiftUI Modals
- ``SwiftUICore/View/charcoalModal(title:style:tapBackgroundToDismiss:duration:maxWidth:isPresented:actions:content:)``
