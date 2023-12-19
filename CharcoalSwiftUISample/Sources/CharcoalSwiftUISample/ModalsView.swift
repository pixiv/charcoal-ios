import Charcoal
import SwiftUI

public struct ModalsView: View {
    @State var isPresented = false
    @State var isBottomPresented = false
    @State var isFullScreenPresented = false
    @State var text1: String = ""
    @State var text2: String = ""
    @State var text3: String = ""

    public var body: some View {
        List {
            // Center
            Button(action: {
                isPresented = true
            }, label: {
                Text("Center")
            })
            .charcoalModal(
                title: "Center",
                isPresented: $isPresented,
                actions: {
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("OK")
                    }).charcoalPrimaryButton(size: .medium, isFixed: false)

                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Dismiss")
                    }).charcoalDefaultButton(size: .medium, isFixed: false)
                }
            ) {
                VStack {
                    Text("Hello This is a center dialog from Charcoal")
                        .charcoalTypography16Regular()
                        .frame(maxWidth: .infinity)

                    if #available(iOS 15, *) {
                        TextField("Simple text field", text: $text1).charcoalTextField()
                    } else {
                        TextField("Simple text field", text: $text1)
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
            // BottomSheet
            Button(action: {
                isBottomPresented = true
            }, label: {
                Text("BottomSheet")
            })
            .charcoalModal(
                title: "BottomSheet",
                style: .bottomSheet,
                isPresented: $isBottomPresented,
                actions: {
                    Button(action: {
                        isBottomPresented = false
                    }, label: {
                        Text("OK")
                    }).charcoalPrimaryButton(size: .medium, isFixed: false)

                    Button(action: {
                        isBottomPresented = false
                    }, label: {
                        Text("Dismiss")
                    }).charcoalDefaultButton(size: .medium, isFixed: false)
                }
            ) {
                VStack {
                    Text("Hello This is a bottom dialog from Charcoal")
                        .charcoalTypography16Regular()
                        .frame(maxWidth: .infinity)

                    if #available(iOS 15, *) {
                        TextField("Simple text field", text: $text2).charcoalTextField()
                    } else {
                        TextField("Simple text field", text: $text2)
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
        .navigationBarTitle("Modals")
    }
}
