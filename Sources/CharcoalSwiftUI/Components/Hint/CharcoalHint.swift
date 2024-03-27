import SwiftUI

public struct CharcoalHint<ActionContent: View>: View {
    /// The text of the tooltip
    let text: String

    /// The text of the tooltip
    let subtitle: String?

    let icon: CharcoalAsset.Images

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 8

    let maxWidth: CGFloat?

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool

    let action: ActionContent?

    @State var timer: Timer?

    public init(
        text: String,
        subtitle: String? = nil,
        icon: CharcoalAsset.Images = .info16,
        maxWidth: CGFloat? = nil,
        isPresenting: Binding<Bool>,
        @ViewBuilder action: () -> ActionContent? = { EmptyView() }
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = icon
        self.maxWidth = maxWidth
        _isPresenting = isPresenting
        self.action = action()
    }

    public var body: some View {
        if isPresenting {
            HStack(spacing: 5) {
                Image(charocalIcon: icon)

                VStack {
                    Text(text).charcoalTypography14Regular()
                    if let subtitle = subtitle {
                        Text(subtitle).charcoalTypography14Regular()
                    }
                }

                if let action = action, type(of: action) != EmptyView.self {
                    Spacer()
                    action.charcoalPrimaryButton(size: .small)
                }
            }
            .frame(maxWidth: maxWidth)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(charcoalColor: .surface3)
            .cornerRadius(cornerRadius, corners: .allCorners)
        }
    }
}

private struct HintsPreviewView: View {
    @State var isPresenting = true
    @State var isPresenting2 = true
    @State var isPresenting3 = true

    @State var textOfLabel = "Hello"

    var body: some View {
        VStack {
            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting) {
                Button(action: {
                    isPresenting = false
                }) {
                    Text("Button")
                }
            }

            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting2)

            CharcoalHint(text: "ヒントテキストヒントテキスト", maxWidth: .infinity, isPresenting: $isPresenting3)

        }.padding()
    }
}

#Preview {
    HintsPreviewView()
}
