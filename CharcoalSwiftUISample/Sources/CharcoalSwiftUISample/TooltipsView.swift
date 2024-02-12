import Charcoal
import SwiftUI

public struct TooltipsView: View {
    @State var isPresented = false

    @State var isPresented2 = false

    @State var isPresented3 = false

    @State var isPresented4 = false

    public var body: some View {
        VStack {
            List {
                HStack {
                    Text("Help")
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Image(charocalIcon: .question16)
                    }).charcoalTooltip(isPresenting: $isPresented, text: "Tooltip created by Charcoal")
                }

                HStack {
                    Text("Help (Multiple Line)")
                    Button(action: {
                        isPresented2.toggle()
                    }, label: {
                        Image(charocalIcon: .question16)
                    }).charcoalTooltip(isPresenting: $isPresented2, text: "Tooltip created by Charcoal and here is testing it's multiple line feature")
                }

                HStack {
                    Text("Help (Auto-Positioning-Trailing)")
                    Spacer()
                    Button(action: {
                        isPresented4.toggle()
                    }, label: {
                        Image(charocalIcon: .question16)
                    }).charcoalTooltip(isPresenting: $isPresented4, text: "Tooltip created by Charcoal and here is testing Auto-Positioning")
                }
            }
            Spacer()
            HStack {
                Text("Help (Auto-Positioning-Bottom)")
                Button(action: {
                    isPresented3.toggle()
                }, label: {
                    Image(charocalIcon: .question16)
                }).charcoalTooltip(isPresenting: $isPresented3, text: "Tooltip created by Charcoal and here is testing Auto-Positioning")
            }
        }
        .charcoalOverlayContainer()
        .navigationBarTitle("Tooltips")
    }
}

#Preview {
    TooltipsView()
}
