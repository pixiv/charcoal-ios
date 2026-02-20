import SwiftUI

struct SelectionsView: View {
    @State var isOn: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                Toggle(isOn: $isOn) {
                    Text("Toggle(\(isOn ? "On" : "Off"))")
                }
                .toggleStyle(charcoalStyle: .default)
                Toggle(isOn: $isOn) {
                    Text("Toggle Disabled(\(isOn ? "On" : "Off"))")
                }
                .disabled(true)
                .toggleStyle(charcoalStyle: .default)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Selections")
    }
}
