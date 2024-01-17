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
            })
            
            // Transparent
            Button(action: {
                isPresentedTransparent.toggle()
            }, label: {
                Text("Transparent")
            })
        }
        .navigationBarTitle("Spinners")
        .charcoalSpinner(isPresenting: $isPresentedCenter)
        .charcoalSpinner(isPresenting: $isPresentedTransparent, transparentBackground: true)
    }
}
