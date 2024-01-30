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
                    Text("Regular")
                }
            })
            
            Button(action: {
                isBigPresented.toggle()
            }, label: {
                VStack(alignment: .leading) {
                    Text("Bigger")
                }
            })
            
            Button(action: {
                isPresentedTransparent.toggle()
            }, label: {
                VStack(alignment: .leading) {
                    Text("Transparent")
                }
            })
            
        }
        .charcoalOverlayContainer()
        .navigationBarTitle("Spinners")
    }
}
