# Charocal Switches

Charcoal Switches are designed to allow the user to toggle between two states.

@Metadata {
    @PageImage(
        purpose: card, 
        source: "Switch", 
        alt: "Charcoal Switches are designed to allow the user to toggle between two states.")
}

## Usage

### SwiftUI Toggle

```swift
Toggle(isOn: $vibrateOnRing) {
        Text("Vibrate on Ring")
    }
    .charcoalToggle()
```

### UIKit Switch

```swift
let button = CharcoalSwitch()
```

## Topics

### Creating SwiftUI Toggle

- ``SwiftUICore/View/charcoalToggle()``


### Creating UIKit Switch

- ``CharcoalSwitch``
