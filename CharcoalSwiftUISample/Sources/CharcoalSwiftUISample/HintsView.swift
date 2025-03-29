import Charcoal
import SwiftUI

public struct HintsView: View {
    @State var isPresented = true

    @State var isPresented2 = true

    @State var isPresented3 = true

    @State var isPresented4 = true

    public var body: some View {
        ScrollView {
            VStack {
                CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresented, action: CharcoalAction(title: "Button") {
                    isPresented = false
                })

                CharcoalHint(text: "ヒントテキストヒントテキスト", isPresenting: $isPresented2)

                CharcoalHint(text: "ヒントテキストヒントテキスト", maxWidth: .infinity, isPresenting: $isPresented3, alignment: .leading)

                CharcoalHint(text: "ヒントテキストヒントテキスト", maxWidth: .infinity, isPresenting: $isPresented4, buttonStyle: .default, action: CharcoalAction(title: "Button") {
                    isPresented = false
                })
            }
            .padding()
        }
        .navigationBarTitle("Hints")
    }
}

@available(iOS 17, *)
#Preview {
    HintsView()
}
