import Charcoal
import SwiftUI

public struct ContentView: View {
    @StateObject private var settings = CharcoalConfig.GlobalSettings()
    
    @State var isDarkModeOn = false

    public init() {}

    public var body: some View {
        NavigationView {
            List {
                Toggle("Dark Mode", isOn: $isDarkModeOn)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isDarkModeOn.toggle()
                    }
                NavigationLink(destination: ButtonsView()) {
                    Text("Buttons")
                }
                if #available(iOS 15, *) {
                    NavigationLink(destination: TextFieldsView()) {
                        Text("Text Fields (iOS 15+)")
                    }
                } else {
                    Text("Text Fields (iOS 15+)")
                        .charcoalOnSurfaceText3()
                }
                NavigationLink(destination: SelectionsView()) {
                    Text("Selections")
                }
                NavigationLink(destination: ColorsView()) {
                    Text("Colors")
                }
                NavigationLink(destination: TypographiesView()) {
                    Text("Typographies")
                }
                NavigationLink(destination: BackgroundView()) {
                    Text("Background")
                }
                NavigationLink(destination: IconsView()) {
                    Text("Icons")
                }
                NavigationLink(destination: ModalsView()) {
                    Text("Modal")
                }
                NavigationLink(destination: TooltipsView().charcoalOverlayContainer()) {
                    Text("Tooltips")
                }
                NavigationLink(destination: ToastsView().charcoalOverlayContainer()) {
                    Text("Toasts")
                }
                NavigationLink(destination: HintsView()) {
                    Text("Hints")
                }
                NavigationLink(destination: SpinnersView()) {
                    Text("Spinners")
                }
                NavigationLink(destination: BalloonsView().charcoalOverlayContainer()) {
                    Text("Balloons")
                }
            }
            .navigationBarTitle("Charcoal")
        }
        .environmentObject(settings)
        .preferredColorScheme(isDarkModeOn ? .dark : .light)
    }
}
