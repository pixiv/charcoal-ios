import SwiftUI
import CharcoalSwiftUI

struct ButtonsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    Button("Primary Button M") {}
                        .buttonStyle(.charcoalPrimary(.init(size: .medium)))
                    Button("Primary Button M") {}
                        .buttonStyle(.charcoalPrimary(.init(size: .medium)))
                        .disabled(true)
                    Button("Primary Button S") {}
                        .buttonStyle(.charcoalPrimary(.init(size: .small)))
                    Button("Primary Button S") {}
                        .buttonStyle(.charcoalPrimary(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Default Button M") {}
                        .buttonStyle(.charcoalDefault(.init(size: .medium)))
                    Button("Default Button M") {}
                        .buttonStyle(.charcoalDefault(.init(size: .medium)))
                        .disabled(true)
                    Button("Default Button S") {}
                        .buttonStyle(.charcoalDefault(.init(size: .small)))
                    Button("Default Button S") {}
                        .buttonStyle(.charcoalDefault(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Default Overlay Button M") {}
                        .buttonStyle(.charcoalDefaultOverlay(.init(size: .medium)))
                    Button("Default Overlay Button M") {}
                        .buttonStyle(.charcoalDefaultOverlay(.init(size: .medium)))
                        .disabled(true)
                    Button("Default Overlay Button S") {}
                        .buttonStyle(.charcoalDefaultOverlay(.init(size: .small)))
                    Button("Default Overlay Button S") {}
                        .buttonStyle(.charcoalDefaultOverlay(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Navigation M") {}
                        .buttonStyle(.charcoalNavigation(.init(size: .medium)))
                    Button("Navigation M") {}
                        .buttonStyle(.charcoalNavigation(.init(size: .medium)))
                        .disabled(true)
                    Button("Navigation S") {}
                        .buttonStyle(.charcoalNavigation(.init(size: .small)))
                    Button("Navigation S") {}
                        .buttonStyle(.charcoalNavigation(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Link") {}
                        .buttonStyle(.charcoalLink)
                    Button("Link") {}
                        .buttonStyle(.charcoalLink)
                        .disabled(true)
                }

                let premiumColor = Color(hue: 0.097, saturation: 0.91, brightness: 0.99)
                VStack(spacing: 8) {
                    Button("Premium") {}
                        .buttonStyle(.charcoalPrimary(.init(primaryColor: premiumColor)))
                    Button("Premium") {}
                        .buttonStyle(.charcoalPrimary(.init(primaryColor: premiumColor)))
                        .disabled(true)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Buttons")
    }
}
