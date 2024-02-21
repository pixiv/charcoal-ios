import Charcoal
import SwiftUI

public struct ToastsView: View {
    @State var isPresenting = false
    @State var isPresenting2 = false
    @State var isPresenting3 = false
    @State var isPresenting4 = false

    public var body: some View {
        List {
            Button {
                isPresenting.toggle()
            } label: {
                Text("SnackBar")
            }
            .charcoalSnackBar(
                isPresenting: $isPresenting,
                text: "ブックマークしました"
            )
            
            VStack(alignment: .leading) {
                Button {
                    isPresenting2.toggle()
                } label: {
                    Text("SnackBar")
                }
                Text("with Action")
            }
            .charcoalSnackBar(
                isPresenting: $isPresenting2,
                text: "ブックマークしました",
                action: {
                    Button {
                        print("Tapped")
                    } label: {
                        Text("編集")
                    }
                }
            )
            
            VStack(alignment: .leading) {
                Button {
                    isPresenting3.toggle()
                } label: {
                    Text("SnackBar")
                }
                Text("with Action and Thumbnail")
            }
            .charcoalSnackBar(
                isPresenting: $isPresenting3,
                text: "ブックマークしました",
                thumbnailImage: Image("SnackbarDemo", bundle: Bundle.module),
                action: {
                    Button {
                        print("Tapped")
                    } label: {
                        Text("編集")
                    }
                }
            )
        }
        .charcoalOverlayContainer()
        .navigationBarTitle("Toasts")
    }
}

#Preview {
    ToastsView()
}
