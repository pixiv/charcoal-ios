import SwiftUI

public enum CharcoalTextFieldStyleToken {
    case `default`(
        label: Binding<String> = .constant(""),
        countLabel: Binding<String> = .constant(""),
        assistiveText: Binding<String> = .constant(""),
        hasError: Binding<Bool> = .constant(false)
    )
}

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
                    .font(charcoalSize: .the14, weight: .regular)
                    .foregroundStyle(Color(charcoalColor: .text1))
                    .lineLimit(1)
            }
            HStack(spacing: 10) {
                configuration
                    .font(charcoalSize: .the14, weight: .regular, isSingleLine: true)
                    .focused($isFocused)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(charcoalColor: .text2))
                if !countLabel.isEmpty {
                    Text(countLabel)
                        .font(charcoalSize: .the14, weight: .regular, isSingleLine: true)
                        // swiftlint:disable line_length
                        .foregroundStyle(Color(charcoalColor: hasError ? .assertive : .text3))
                }
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
            .background(charcoalColor: .surface3)
            .cornerRadius(4.0)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(borderColor, lineWidth: 4)
            )
            if !assistiveText.isEmpty {
                Text(assistiveText)
                    .font(charcoalSize: .the14, weight: .regular)
                    .foregroundStyle(Color(charcoalColor: hasError ? .assertive : .text2))
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
    func textFieldStyle(charcoalStyle: CharcoalTextFieldStyleToken) -> some View {
        switch charcoalStyle {
        case let .default(label, countLabel, assistiveText, hasError):
            modifier(CharcoalTextFieldStyleModifier(
                label: label,
                countLabel: countLabel,
                assistiveText: assistiveText,
                hasError: hasError
            ))
        }
    }

    @available(*, deprecated, message: "Use textFieldStyle(charcoalStyle:) instead.")
    func charcoalTextField(
        label: Binding<String> = .constant(""),
        countLabel: Binding<String> = .constant(""),
        assistiveText: Binding<String> = .constant(""),
        hasError: Binding<Bool> = .constant(false)
    ) -> some View {
        textFieldStyle(charcoalStyle: .default(
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
                .textFieldStyle(charcoalStyle: .default())
            TextField("Placeholder", text: $text2)
                .textFieldStyle(charcoalStyle: .default(
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
                ))
            TextField("", text: .constant("Text"))
                .disabled(true)
                .textFieldStyle(charcoalStyle: .default(
                    label: .constant("Label"),
                    countLabel: .constant("0/10"),
                    assistiveText: .constant("Assistive text")
                ))
        }.padding()
    }
#endif
