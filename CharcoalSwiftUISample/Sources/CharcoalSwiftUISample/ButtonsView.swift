import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    Button("Primary Button M") {}
                        .charcoalPrimaryButton(size: .medium)
                    Button("Primary Button M") {}
                        .charcoalPrimaryButton(size: .medium)
                        .disabled(true)
                    Button("Primary Button S") {}
                        .charcoalPrimaryButton(size: .small)
                    Button("Primary Button S") {}
                        .charcoalPrimaryButton(size: .small)
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Default Button M") {}
                        .charcoalDefaultButton(size: .medium)
                    Button("Default Button M") {}
                        .charcoalDefaultButton(size: .medium)
                        .disabled(true)
                    Button("Default Button S") {}
                        .charcoalDefaultButton(size: .small)
                    Button("Default Button S") {}
                        .charcoalDefaultButton(size: .small)
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Default Overlay Button M") {}
                        .charcoalDefaultOverlayButton(size: .medium)
                    Button("Default Overlay Button M") {}
                        .charcoalDefaultOverlayButton(size: .medium)
                        .disabled(true)
                    Button("Default Overlay Button S") {}
                        .charcoalDefaultOverlayButton(size: .small)
                    Button("Default Overlay Button S") {}
                        .charcoalDefaultOverlayButton(size: .small)
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Navigation M") {}
                        .charcoalNavigationButton(size: .medium)
                    Button("Navigation M") {}
                        .charcoalNavigationButton(size: .medium)
                        .disabled(true)
                    Button("Navigation S") {}
                        .charcoalNavigationButton(size: .small)
                    Button("Navigation S") {}
                        .charcoalNavigationButton(size: .small)
                        .disabled(true)
                }

                VStack(spacing: 8) {
                    Button("Link") {}
                        .charcoalLinkButton()
                    Button("Link") {}
                        .charcoalLinkButton()
                        .disabled(true)
                }

                let premiumColor = Color(hue: 0.097, saturation: 0.91, brightness: 0.99)
                VStack(spacing: 8) {
                    Button("Premium") {}
                        .charcoalPrimaryButton(primaryColor: premiumColor)
                    Button("Premium") {}
                        .charcoalPrimaryButton(primaryColor: premiumColor)
                        .disabled(true)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Buttons")
    }
}
