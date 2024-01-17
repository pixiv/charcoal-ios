import Charcoal
import SwiftUI

public struct SpinnersView: View {
    @State var isPresentedCenter = false
    @State var isPresentedTransparent = false
    
    public var body: some View {
        List {
            // Center
            Button(action: {
                isPresentedCenter.toggle()
            }, label: {
                Text("Center")
            }).charcoalSpinner(isPresenting: $isPresentedCenter)
            
            // Transparent
            Button(action: {
                isPresentedTransparent.toggle()
            }, label: {
                Text("Transparent")
            })
        }
        .navigationBarTitle("Spinners")
        .charcoalOverlayContainer()
    }
}
