import Charcoal
import SwiftUI

public struct SpinnersView: View {
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

            Button(action: {
                isOverlayShow.toggle()
            }, label: {
                Text("Show test overlay on List View")
            })
        }
        .overlay(
            isOverlayShow ?
                Color.blue.opacity(0.2).ignoresSafeArea().allowsHitTesting(false) : nil
        )
        .charcoalSpinner(isPresenting: $isPresented)
        .charcoalSpinner(isPresenting: $isBigPresented, spinnerSize: 80)
        .charcoalSpinner(isPresenting: $isPresentedTransparent, transparentBackground: true)
        .navigationBarTitle("Spinners")
        .toolbar {
            Button("Dismiss") {
                isPresented = false
                isBigPresented = false
                isPresentedTransparent = false
                isOverlayShow = false
            }
        }
    }
}

#Preview {
    NavigationView {
        SpinnersView()
    }
}
