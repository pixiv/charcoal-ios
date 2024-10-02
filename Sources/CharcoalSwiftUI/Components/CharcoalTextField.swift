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
        var borderRingColor: Color = .clear
        var borderColor: Color = .clear
        if hasError {
            borderRingColor = Color(CharcoalFoundation.Colors.borderNegative.value)
        } else if isFocused {
            borderColor = Color(CharcoalFoundation.Colors.borderFocus1.value)
            borderRingColor = Color(CharcoalFoundation.Colors.borderFocus2.value)
        }
        
        return VStack(alignment: .leading, spacing: 8) {
            if !label.isEmpty {
                Text(label)
                    .charcoalTypography14Regular()
                    .charcoalText(applyToken: .default, state: .default)
                    .lineLimit(1)
            }
            HStack(spacing: 10) {
                configuration
                    .charcoalTypography14Regular(isSingleLine: true)
                    .focused($isFocused)
                    .frame(maxWidth: .infinity)
                    .charcoalText(applyToken: .onSecondary, state: .default)
                if !countLabel.isEmpty {
                    Text(countLabel)
                        .charcoalTypography14Regular(isSingleLine: true)
                        // swiftlint:disable line_length
                        .foregroundStyle(charcoalColor: hasError ? .containerNegativeDefault : .textTertiaryDefault)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8))
            .charcoalBackground(applyToken: .secondary)
            .cornerRadius(4.0)
            .overlay(
                RoundedRectangle(cornerRadius: 4.0)
                    .stroke(borderRingColor, lineWidth: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 4.0)
                    .stroke(borderColor, lineWidth: 1)
                    .padding(1)
            )
            if !assistiveText.isEmpty {
                Text(assistiveText)
                    .charcoalTypography14Regular()
                    .foregroundStyle(charcoalColor: hasError ? .containerNegativeDefault : .textSecondaryDefault)
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

@available(iOS 15, *)
#Preview {
    @State var text1 = ""
    @State var text2 = ""

    return VStack(spacing: 16) {
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
