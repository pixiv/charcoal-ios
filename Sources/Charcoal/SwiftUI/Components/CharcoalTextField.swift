import SwiftUI

@available(iOS 15, *)
struct CharcoalTextFieldStyle: TextFieldStyle {
    @Environment(\.isEnabled) var isEnabled
    @Binding var label: String
    @Binding var countLabel: String
    @Binding var assistiveText: String
    @Binding var hasError: Bool
    @FocusState private var isFocused: Bool

    // swiftlint:disable identifier_name
    func _body(configuration: TextField<_Label>) -> some View {
        var borderColor: Color = .clear
        if hasError {
            borderColor = Color(CharcoalAsset.ColorPaletteGenerated.assertive.color.withAlphaComponent(0.32))
        } else if isFocused {
            borderColor = Color(CharcoalAsset.ColorPaletteGenerated.brand.color.withAlphaComponent(0.32))
        }
        return VStack(alignment: .leading, spacing: 8) {
            if !label.isEmpty {
                Text(label)
                    .charcoalTypography14Regular()
                    .charcoalOnSurfaceText1()
                    .lineLimit(1)
            }
            HStack(spacing: 0) {
                configuration
                    .charcoalTypography14Regular()
                    .focused($isFocused)
                    .padding(8.0)
                    .frame(maxWidth: .infinity)
                    .charcoalOnSurfaceText2()
                if !countLabel.isEmpty {
                    Text(countLabel)
                        .charcoalTypography14Regular()
                        .padding(8.0)
                        // swiftlint:disable line_length
                        .foregroundStyle(charcoalColor: hasError ? .assertive : .text3)
                }
            }
            .frame(height: 40)
            .charcoalSurface3()
            .cornerRadius(4.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(borderColor, lineWidth: 4)
            )
            if !assistiveText.isEmpty {
                Text(assistiveText)
                    .charcoalTypography14Regular()
                    .foregroundStyle(charcoalColor: hasError ? .assertive : .text2)
            }
        }
        .opacity(isEnabled ? 1.0 : 0.32)
    }
}

@available(iOS 15, *)
struct CharcoalTextFieldStyleModifier: ViewModifier {
    @Binding var label: String
    @Binding var countLabel: String
    @Binding var assistiveText: String
    @Binding var hasError: Bool

    func body(content: Content) -> some View {
        return content.textFieldStyle(CharcoalTextFieldStyle(
            label: $label,
            countLabel: $countLabel,
            assistiveText: $assistiveText,
            hasError: $hasError
        ))
    }
}

@available(iOS 15, *)
public extension View {
    @warn_unqualified_access
    func charcoalTextField(
        label: Binding<String> = .constant(""),
        countLabel: Binding<String> = .constant(""),
        assistiveText: Binding<String> = .constant(""),
        hasError: Binding<Bool> = .constant(false)
    ) -> some View {
        return modifier(CharcoalTextFieldStyleModifier(
            label: label,
            countLabel: countLabel,
            assistiveText: assistiveText,
            hasError: hasError
        ))
    }
}
