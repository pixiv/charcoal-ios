import Charcoal
import SwiftUI

public struct TooltipsView: View {
    @State var isOverlayShow = false
    @State var isPresented = false
    @State var isBigPresented = false
    @State var isPresentedTransparent = false
    
    @State var isPresentedTooltipGlobal = false
    @State var isPresentedTooltip = false
    
    public var body: some View {
        List {
            Button(action: {
                isPresented.toggle()
            }, label: {
                VStack(alignment: .leading) {
                    Image(charocalIcon: .question16)
                }
            }).charcoalTooltip(isPresenting: $isPresented, text: "Tooltip created by Charcoal")
        }
        .charcoalOverlayContainer()
        .navigationBarTitle("Tooltips")
    }
}
