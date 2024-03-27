import SwiftUI

struct CharcoalHint<ActionContent:View>: View {
    /// The text of the tooltip
    let text: String

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 8

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool
    
    let action: ActionContent?
    
    @State var timer: Timer?

    init(
        text: String,
        isPresenting: Binding<Bool>,
        @ViewBuilder action: () -> ActionContent?
    ) {
        self.text = text
        _isPresenting = isPresenting
        self.action = action()
    }

    var body: some View {
        HStack(spacing: 5) {
            Image(charocalIcon: .info16)
            Text(text).charcoalTypography14Regular()
            
            if let action = action {
                Spacer()
                action.charcoalPrimaryButton(size: .small)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
        .background(charcoalColor: .background2)
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
        ScrollView {
            ZStack(alignment: .center) {
                Color.clear
                CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresenting) {
                    Button(action: {
                        print("Hello")
                    }) {
                        Text("Button")
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    HintsPreviewView()
}
