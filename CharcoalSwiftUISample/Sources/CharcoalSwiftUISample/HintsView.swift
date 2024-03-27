import Charcoal
import SwiftUI

public struct HintsView: View {
    @State var isPresented = true

    @State var isPresented2 = true

    @State var isPresented3 = true

    public var body: some View {
        ScrollView {
            VStack {
                CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresented) {
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Button")
                    }
                }

                CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresented2)

                CharcoalHint(text: "ヒントテキストヒントテキスト", maxWidth: .infinity, isPresenting: $isPresented3)
            }
            .padding()
        }
        .navigationBarTitle("Hints")
    }
}

#Preview {
    HintsView()
}
