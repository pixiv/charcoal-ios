import SwiftUI

struct TextFieldsView: View {
    @State var text1: String = ""
    @State var text2: String = ""

    var body: some View {
        ScrollView {
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
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("TextFields")
    }
}
