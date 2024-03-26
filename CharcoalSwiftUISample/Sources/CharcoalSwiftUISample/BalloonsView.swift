import Charcoal
import SwiftUI

public struct BalloonsView: View {
    @State var isPresented = false

    @State var isPresented2 = false

    @State var isPresented3 = false

    @State var isPresented4 = false

    public var body: some View {
        VStack {
            List {
                HStack {
                    Text("Tutorial")
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalBalloon(isPresenting: $isPresented,
                                     text: "作品中の特定単語について")
                }

                HStack {
                    Text("Tutorial (With Action)")
                    Button {
                        isPresented2.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalBalloon(isPresenting: $isPresented2, text: "作品中の特定単語について、単語変換をして読めるようになりました") {
                        Button(action: {
                            
                        }, label: {
                            Text("詳しく")
                        })
                    }
                }

                HStack {
                    Text("Tutorial (Auto-Positioning-Trailing)")
                    Spacer()
                    Button {
                        isPresented3.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalBalloon(isPresenting: $isPresented3,
                                     text: "作品中の特定単語について")
                }
            }
            Spacer()
            HStack {
                Text("Tutorial")
                Button {
                    isPresented4.toggle()
                } label: {
                    Image(charocalIcon: .question24)
                }
                .charcoalBalloon(isPresenting: $isPresented4,
                                 text: "Hello World This is a tooltip and here is testing it's multiple line feature")
            }
        }
        .navigationBarTitle("Tooltips")
    }
}

#Preview {
    BalloonsView().charcoalOverlayContainer()
}

