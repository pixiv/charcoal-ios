# charcoal-ios New API

## 概要

`charcoal-ios` のSwiftUI向けAPIを、SwiftUIのAPIに近い形に整理しました。従来の `charcoal...` 形式は互換のためにDepreacatedで残しつつ、段階的に新APIへ移行できます。

---

## 変更のモチベーション

- SwiftUIで一般的な書き方（`buttonStyle`, `textFieldStyle`, `toggleStyle`, `font`）へ寄せる
- APIの一貫性を向上

---

## 追加・整理したAPI

- `buttonStyle(charcoalStyle:)`
- `textFieldStyle(charcoalStyle:)`
- `toggleStyle(charcoalStyle:)`
- `font(charcoalSize:weight:mono:isSingleLine:textStyle:)`
- `Color(charcoalColor:)`
- `UIColor(charcoalColor:)`
- `foregroundStyle(charcoalColor:)` // すでに存在している

---

## Before / After

### Button

```swift
// Before
Button("OK") { ... }
    .charcoalPrimaryButton(size: .medium, isFixed: false)

// After
Button("OK") { ... }
    .buttonStyle(charcoalStyle: .primary(.init(size: .medium, isFixed: false)))
```

### TextField

```swift
// Before
TextField("Placeholder", text: $text)
    .charcoalTextField(
        label: .constant("Label"),
        countLabel: .constant("0/10"),
        assistiveText: .constant("Assistive text")
    )

// After
TextField("Placeholder", text: $text)
    .textFieldStyle(charcoalStyle: .default(
        label: .constant("Label"),
        countLabel: .constant("0/10"),
        assistiveText: .constant("Assistive text")
    ))
```

### Toggle

```swift
// Before
Toggle("Enabled", isOn: $isOn)
    .charcoalToggle()

// After
Toggle("Enabled", isOn: $isOn)
    .toggleStyle(charcoalStyle: .default)
```

### Typography

```swift
// Before
Text("Title")
    .charcoalTypography16Bold()

Text("A") + Text("B")
    .font(charcoalTypography: .regular14)

// After
Text("Title")
    .font(charcoalSize: .the16, weight: .bold)

Text("A") + Text("B")
    .font(charcoalSize: .the14, weight: .regular)
```

### Color（SwiftUI）

```swift
// Before(すでに存在している)
Text("Label")
    .foregroundStyle(charcoalColor: .text1)

// After
// foregroundStyleはそのまま
Text("Label")
    .foregroundStyle(charcoalColor: .text1)

// Color(charcoalColor:) でも呼べるように
Icon()
    .tint(Color(charcoalColor: .icon1))
```

### Color（UIKit）

```swift
// Before
let color = CharcoalAsset.ColorPaletteGenerated.brand.color

// After
let color = UIColor(charcoalColor: .brand)
```

