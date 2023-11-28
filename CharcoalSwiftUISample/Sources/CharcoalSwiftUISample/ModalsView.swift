import Charcoal
import SwiftUI

public struct ModalsView: View {
    @State var isPresented = false
    @State var isBottomPresented = false
    @State var text1: String = ""
    @State var text2: String = ""
    
    public var body: some View {
        List {
            Button(action: {
                isPresented = true
            }, label: {
                Text("Center")
            })
            .charcoalModal(title: "Title",
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
            }) {
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
            
            Button(action: {
                isBottomPresented = true
            }, label: {
                Text("Bottom")
            })
            .charcoalModal(title: "Title",
                           style: .bottom,
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
            }) {
                VStack {
                    Text("Hello This is a bottom dialog from Charcoal")
                        .charcoalTypography16Regular()
                        .frame(maxWidth: .infinity)
                    
                    if #available(iOS 15, *) {
                        TextField("Simple text field", text: $text1).charcoalTextField()
                    } else {
                        TextField("Simple text field", text: $text1)
                    }
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
        .navigationBarTitle("Modals")
    }
}
