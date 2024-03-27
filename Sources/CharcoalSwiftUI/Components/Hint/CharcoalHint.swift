import SwiftUI

struct CharcoalHint<ActionContent:View>: View {
    /// The text of the tooltip
    let text: String
    
    /// The text of the tooltip
    let subtitle: String?
    
    let icon: CharcoalAsset.Images

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 8

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool
    
    let action: ActionContent?
    
    @State var timer: Timer?

    init(
        text: String,
        subtitle: String? = nil,
        icon: CharcoalAsset.Images = .info16,
        isPresenting: Binding<Bool>,
        @ViewBuilder action: () -> ActionContent? = { EmptyView() }
    ) {
        self.text = text
        self.subtitle = subtitle
        self.icon = icon
        _isPresenting = isPresenting
        self.action = action()
    }

    var body: some View {
        HStack(spacing: 5) {
            Image(charocalIcon: icon)
            
            VStack {
                Text(text).charcoalTypography14Regular()
                if let subtitle = subtitle {
                    Text(subtitle).charcoalTypography14Regular()
                }
            }
            
            if let action = action, type(of:action) != EmptyView.self {
                Spacer()
                action.charcoalPrimaryButton(size: .small)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(charcoalColor: .surface3)
        .cornerRadius(cornerRadius, corners: .allCorners)
    }
}


private struct HintsPreviewView: View {
    @State var isPresenting = true
    @State var isPresenting2 = true
    @State var isPresenting3 = true
    @State var isPresenting4 = true
    @State var isPresenting5 = true
    @State var isPresenting6 = true

    @State var textOfLabel = "Hello"

    var body: some View {
        VStack {
            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting) {
                Button(action: {
                    print("Hello")
                }) {
                    Text("Button")
                }
            }
            
            CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting)
        }.padding()
    }
}

#Preview {
    HintsPreviewView()
}
