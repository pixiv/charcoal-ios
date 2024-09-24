import SwiftUI

struct BackgroundView: View {
    @State var isOn: Bool = false

    var body: some View {
        ZStack {
            Color.clear.charcoalBackground(applyToken: .secondary, ignoresSafeAreaEdges: isOn ? .all : [])
            ScrollView {
                Toggle(isOn: $isOn) {
                    Text("Ignores SafeArea Edges")
                }
                .padding()
                .charcoalToggle()
            }
        }
        .navigationBarTitle("Background")
    }
}
