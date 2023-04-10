import SwiftUI

@available(iOS 13, *)
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

// iOS 13のSwiftUIでは、onTintColorを変えられないのでToggleStyleで書き換え
@available(iOS 13, *)
struct CharcoalToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            CharcoalToggleWrapper(isOn: configuration.$isOn)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                .opacity(isEnabled ? 1.0 : 0.32)
        }
        .onTapGesture {
            configuration.isOn = !configuration.isOn
        }
    }
}

@available(iOS 13, *)
struct CharcoalToggleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content.toggleStyle(CharcoalToggleStyle())
    }
}

@available(iOS 13, *)
public extension View {
    func charcoalToggle() -> some View {
        return modifier(CharcoalToggleStyleModifier())
    }
}
