import SwiftUI

public struct CharcoalHint: View {
    /// The text of the  hint view
    let text: String

    /// The subtitle text of the  hint view
    let subtitle: String?

    let icon: CharcoalAsset.Images = .info16

    /// The corner radius of the  hint view
    let cornerRadius: CGFloat = 8

    let maxWidth: CGFloat?

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool

    let action: CharcoalAction?

    /// The alignment of hint view
    let alignment: Alignment

    let buttonStyle: CharcoalButtonStyle

    public init(
        text: String,
        subtitle: String? = nil,
        maxWidth: CGFloat? = nil,
        isPresenting: Binding<Bool>,
        alignment: Alignment = .center,
        buttonStyle: CharcoalButtonStyle = .primary(.init(primaryColor: Color(CharcoalAsset.ColorPaletteGenerated.brand.color))),
        action: CharcoalAction? = nil
    ) {
        self.text = text
        self.subtitle = subtitle
        self.maxWidth = maxWidth
        _isPresenting = isPresenting
        self.action = action
        self.alignment = alignment
        self.buttonStyle = buttonStyle
    }

    public var body: some View {
        if isPresenting {
            HStack(spacing: 4) {
                Image(charcoalIcon: icon)

                VStack {
                    Text(text).charcoalTypography14Regular()
                    if let subtitle = subtitle {
                        Text(subtitle).charcoalTypography14Regular()
                    }
                }

                if let action = action {
                    Spacer()
                    Button(action: {
                        action.actionCallback()
                    }) {
                        Text(action.title)
                    }.charcoalButtonStyle(buttonStyle)
                }
            }
            .frame(maxWidth: maxWidth, alignment: alignment)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(charcoalColor: .surface3)
            .cornerRadius(cornerRadius, corners: .allCorners)
        }
    }
}

#if compiler(>=6.0)
    @available(iOS 17, *)
    #Preview {
        @Previewable @State var isPresenting = true
        @Previewable @State var isPresenting2 = true
        @Previewable @State var isPresenting3 = true
        @Previewable @State var isPresenting4 = true
        @Previewable @State var textOfLabel = "Hello"

        VStack {
            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting, action: CharcoalAction(title: "Button", actionCallback: {
                isPresenting = false
            }))

            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting2, buttonStyle: .default, action: CharcoalAction(title: "Button", actionCallback: {
                isPresenting2 = false
            }))

            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting3)

            CharcoalHint(text: "ヒントテキストヒントテキスト", maxWidth: .infinity, isPresenting: $isPresenting4, alignment: .leading)

        }.padding()
    }
#endif
