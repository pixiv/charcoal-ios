import Charcoal
import SwiftUI

public struct ContentView: View {
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
                NavigationLink(destination: TextFieldsView()) {
                    Text("Text Fields")
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
                NavigationLink(destination: IconsView().charcoalOverlayContainer()) {
                    Text("Icons")
                }
                NavigationLink(destination: IconsV2View().charcoalOverlayContainer()) {
                    Text("Icons 2.0")
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
        .preferredColorScheme(isDarkModeOn ? .dark : .light)
    }
}
