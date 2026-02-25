import SwiftUI

public enum CharcoalTextFieldStyle {
    case `default`(
        label: Binding<String> = .constant(""),
        countLabel: Binding<String> = .constant(""),
        assistiveText: Binding<String> = .constant(""),
        hasError: Binding<Bool> = .constant(false)
    )
}

private struct CharcoalDefaultTextFieldStyle: TextFieldStyle {
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
                    .foregroundStyle(charcoalColor: .text1)
                    .lineLimit(1)
            }
            HStack(spacing: 10) {
                configuration
                    .font(charcoalSize: .the14, weight: .regular, isSingleLine: true)
                    .focused($isFocused)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(charcoalColor: .text2)
                if !countLabel.isEmpty {
                    Text(countLabel)
                        .font(charcoalSize: .the14, weight: .regular, isSingleLine: true)
                        // swiftlint:disable line_length
                        .foregroundStyle(charcoalColor: hasError ? .assertive : .text3)
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
                    .foregroundStyle(charcoalColor: hasError ? .assertive : .text2)
            }
        }
        .opacity(isEnabled ? 1.0 : 0.32)
    }
}

extension CharcoalTextFieldStyle: TextFieldStyle {
    // swiftlint:disable identifier_name
    public func _body(configuration: TextField<_Label>) -> some View {
        switch self {
        case let .default(label, countLabel, assistiveText, hasError):
            CharcoalDefaultTextFieldStyle(
                label: label,
                countLabel: countLabel,
                assistiveText: assistiveText,
                hasError: hasError
            )._body(configuration: configuration)
        }
    }
}

public extension TextFieldStyle where Self == CharcoalTextFieldStyle {
    static var charcoalDefault: Self {
        .default()
    }

    static func charcoalDefault(
        label: Binding<String> = .constant(""),
        countLabel: Binding<String> = .constant(""),
        assistiveText: Binding<String> = .constant(""),
        hasError: Binding<Bool> = .constant(false)
    ) -> Self {
        .default(
            label: label,
            countLabel: countLabel,
            assistiveText: assistiveText,
            hasError: hasError
        )
    }
}

public extension View {
    @available(*, deprecated, message: "Use textFieldStyle(_:) with CharcoalTextFieldStyle instead.")
    func textFieldStyle(charcoalStyle: CharcoalTextFieldStyle) -> some View {
        textFieldStyle(charcoalStyle)
    }

    @available(*, deprecated, message: "Use textFieldStyle(_:) with CharcoalTextFieldStyle instead.")
    func charcoalTextField(
        label: Binding<String> = .constant(""),
        countLabel: Binding<String> = .constant(""),
        assistiveText: Binding<String> = .constant(""),
        hasError: Binding<Bool> = .constant(false)
    ) -> some View {
        textFieldStyle(.charcoalDefault(
            label: label,
            countLabel: countLabel,
            assistiveText: assistiveText,
            hasError: hasError
        ))
    }
}

@available(*, deprecated, renamed: "CharcoalTextFieldStyle")
public typealias CharcoalTextFieldStyleToken = CharcoalTextFieldStyle

#if compiler(>=6.0)
    @available(iOS 17, *)
    #Preview {
        @Previewable @State var text1 = ""
        @Previewable @State var text2 = ""

        VStack(spacing: 16) {
            TextField("Simple text field", text: $text1)
                .textFieldStyle(.charcoalDefault)
            TextField("Placeholder", text: $text2)
                .textFieldStyle(.charcoalDefault(
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
                .textFieldStyle(.charcoalDefault(
                    label: .constant("Label"),
                    countLabel: .constant("0/10"),
                    assistiveText: .constant("Assistive text")
                ))
        }.padding()
    }
#endif
