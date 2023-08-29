import CharcoalSwiftUI
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
                if #available(iOS 15, macOS 12, *) {
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
            }
            .navigationBarTitle("Charcoal")
        }
        .preferredColorScheme(isDarkModeOn ? .dark : .light)
    }
}
