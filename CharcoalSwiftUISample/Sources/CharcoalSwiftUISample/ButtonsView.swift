import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    Button("Primary Button M") {}
                        .buttonStyle(charcoalStyle: .primary(.init(size: .medium)))
                    Button("Primary Button M") {}
                        .buttonStyle(charcoalStyle: .primary(.init(size: .medium)))
                        .disabled(true)
                    Button("Primary Button S") {}
                        .buttonStyle(charcoalStyle: .primary(.init(size: .small)))
                    Button("Primary Button S") {}
                        .buttonStyle(charcoalStyle: .primary(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Default Button M") {}
                        .buttonStyle(charcoalStyle: .defaultButton(.init(size: .medium)))
                    Button("Default Button M") {}
                        .buttonStyle(charcoalStyle: .defaultButton(.init(size: .medium)))
                        .disabled(true)
                    Button("Default Button S") {}
                        .buttonStyle(charcoalStyle: .defaultButton(.init(size: .small)))
                    Button("Default Button S") {}
                        .buttonStyle(charcoalStyle: .defaultButton(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Default Overlay Button M") {}
                        .buttonStyle(charcoalStyle: .defaultOverlay(.init(size: .medium)))
                    Button("Default Overlay Button M") {}
                        .buttonStyle(charcoalStyle: .defaultOverlay(.init(size: .medium)))
                        .disabled(true)
                    Button("Default Overlay Button S") {}
                        .buttonStyle(charcoalStyle: .defaultOverlay(.init(size: .small)))
                    Button("Default Overlay Button S") {}
                        .buttonStyle(charcoalStyle: .defaultOverlay(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Navigation M") {}
                        .buttonStyle(charcoalStyle: .navigation(.init(size: .medium)))
                    Button("Navigation M") {}
                        .buttonStyle(charcoalStyle: .navigation(.init(size: .medium)))
                        .disabled(true)
                    Button("Navigation S") {}
                        .buttonStyle(charcoalStyle: .navigation(.init(size: .small)))
                    Button("Navigation S") {}
                        .buttonStyle(charcoalStyle: .navigation(.init(size: .small)))
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Link") {}
                        .buttonStyle(charcoalStyle: .link)
                    Button("Link") {}
                        .buttonStyle(charcoalStyle: .link)
                        .disabled(true)
                }

                let premiumColor = Color(hue: 0.097, saturation: 0.91, brightness: 0.99)
                VStack(spacing: 8) {
                    Button("Premium") {}
                        .buttonStyle(charcoalStyle: .primary(.init(primaryColor: premiumColor)))
                    Button("Premium") {}
                        .buttonStyle(charcoalStyle: .primary(.init(primaryColor: premiumColor)))
                        .disabled(true)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Buttons")
    }
}
