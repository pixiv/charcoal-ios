import SwiftUI
import CharcoalSwiftUI

struct SelectionsView: View {
    @State var isOn: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                Toggle(isOn: $isOn) {
                    Text("Toggle(\(isOn ? "On" : "Off"))")
                }
                .toggleStyle(.charcoalDefault)
                Toggle(isOn: $isOn) {
                    Text("Toggle Disabled(\(isOn ? "On" : "Off"))")
                }
                .disabled(true)
                .toggleStyle(.charcoalDefault)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Selections")
    }
}
