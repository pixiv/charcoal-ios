import SwiftUI

struct CharcoalToggleWrapper: UIViewRepresentable {
    var isOn: Binding<Bool>

    init(isOn: Binding<Bool>) {
        self.isOn = isOn
    }

    func makeUIView(context _: Context) -> UISwitch {
        let uiSwitch = UISwitch()
        uiSwitch.addTarget(self, action: #selector(Coordinator.handleValueChanged(_:)), for: .valueChanged)
        return uiSwitch
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func updateUIView(_ uiView: UISwitch, context _: Context) {
        uiView.onTintColor = CharcoalAsset.ColorPaletteGenerated.brand.color
        uiView.tintColor = CharcoalAsset.ColorPaletteGenerated.surface4.color

        uiView.isOn = isOn.wrappedValue
    }

    class Coordinator: NSObject {
        var toggleWrapper: CharcoalToggleWrapper

        init(_ toggleWrapper: CharcoalToggleWrapper) {
            self.toggleWrapper = toggleWrapper
            super.init()
        }

        @objc
        func handleValueChanged(_ sender: UISwitch) {
            toggleWrapper.isOn.wrappedValue = sender.isOn
        }
    }
}

struct CharcoalToggleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.tint(Color(CharcoalAsset.ColorPaletteGenerated.brand.color))
        } else if #available(iOS 14.0, *) {
            content.toggleStyle(SwitchToggleStyle(tint: Color(CharcoalAsset.ColorPaletteGenerated.brand.color)))
        } else {
            content
       }
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalToggle() -> some View {
        return modifier(CharcoalToggleStyleModifier())
    }
}
