import Charcoal
import SwiftUI

@available(iOS 15, *)
public struct SpinnersView: View {
    @State var isPresentedCenter = false
    @State var isPresentedCenterGlobal = false
    @State var isPresentedCenterLocal = false
    @State var isOverlayShow = false
    @State var isPresentedFullScreen = false
    @State var isPresentedFullScreenGlobal = false
    @State var isPresentedTransparent = false
    
    @State var isPresentedTooltipGlobal = false
    @State var isPresentedTooltip = false
    
    public var body: some View {
        List {
   
            Section("Modifier using Global overlay") {
                
                Button(action: {
                    isPresentedCenterGlobal.toggle()
                }, label: {
                    Text("Center HUD")
                }).charcoalSpinnerGlobal(isPresenting: $isPresentedCenterGlobal)
                
                
                Button(action: {
                    isPresentedFullScreenGlobal.toggle()
                }, label: {
                    Text("Sheet")
                }).sheet(isPresented: $isPresentedFullScreenGlobal) {
                    Button(action: {
                        isPresentedCenterGlobal.toggle()
                    }, label: {
                        Text("Show Center HUD")
                    })
                }
                
                Button(action: {
                    isPresentedTooltipGlobal.toggle()
                }, label: {
                    Text("Tooltip")
                }).charcoalTooltipGlobal(isPresenting: $isPresentedTooltipGlobal, text: "Made by Charcoal")
            }
            
            Section("Modifier attached overlay to Component") {
                
                Button(action: {
                    isPresentedCenter.toggle()
                }, label: {
                    Text("Center HUD")
                }).charcoalSpinner(isPresenting: $isPresentedCenter)
                
                
                Button(action: {
                    isPresentedFullScreen.toggle()
                }, label: {
                    Text("Sheet")
                }).sheet(isPresented: $isPresentedFullScreen) {
                    Button(action: {
                        isPresentedTransparent.toggle()
                    }, label: {
                        Text("Show Center HUD")
                    })
                    .charcoalSpinner(isPresenting: $isPresentedTransparent)
                }
                
                
                Button(action: {
                    isPresentedCenterLocal.toggle()
                }, label: {
                    VStack(alignment: .leading) {
                        Text("Center HUD")
                        Text("Modifier attached to List View").foregroundStyle(Color.gray)
                    }
                })
                
                Button(action: {
                    isPresentedTooltipGlobal.toggle()
                }, label: {
                    Text("Tooltip can only be attached to Global overlay")
                })
            }
            
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

        .charcoalSpinner(isPresenting: $isPresentedCenterLocal)
        .navigationBarTitle("Spinners")
       
    }
}
