import SwiftUI

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
            HStack(spacing: 10) {
                configuration
                    .charcoalTypography14Regular(isSingleLine: true)
                    .focused($isFocused)
                    .frame(maxWidth: .infinity)
                    .charcoalOnSurfaceText2()
                if !countLabel.isEmpty {
                    Text(countLabel)
                        .charcoalTypography14Regular(isSingleLine: true)
                        // swiftlint:disable line_length
                        .foregroundStyle(charcoalColor: hasError ? .assertive : .text3)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
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

public extension View {
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

#if compiler(>=6.0)
    @available(iOS 17, *)
    #Preview {
        @Previewable @State var text1 = ""
        @Previewable @State var text2 = ""

        VStack(spacing: 16) {
            TextField("Simple text field", text: $text1)
                .charcoalTextField()
            TextField("Placeholder", text: $text2)
                .charcoalTextField(
                    label: .constant("Label"),
                    countLabel: .init(
                        get: { "\(text2.count)/10" },
                        set: { _ in }
                    ),
                    assistiveText: .init(
                        get: { text2.count > 10 ? "Error" : "OK" },
                        set: { _ in }
                    ),
                    hasError: .init(
                        get: { text2.count > 10 },
                        set: { _ in }
                    )
                )
            TextField("", text: .constant("Text"))
                .disabled(true)
                .charcoalTextField(
                    label: .constant("Label"),
                    countLabel: .constant("0/10"),
                    assistiveText: .constant("Assistive text")
                )
        }.padding()
    }
#endif
