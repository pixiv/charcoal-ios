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
        uiView.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface4.color
        uiView.layer.cornerRadius = uiView.frame.size.height / 2.0
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

// SwiftUIでToggleを自由にカスタマイズするのは難しいのでToggleStyleで書き換え
struct CharcoalToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
                .charcoalTypography14Regular()
                .charcoalOnSurfaceText1()
            Spacer()
            CharcoalToggleWrapper(isOn: configuration.$isOn)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                .opacity(isEnabled ? 1.0 : 0.32)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            configuration.isOn = !configuration.isOn
        }
    }
}

struct CharcoalToggleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content.toggleStyle(CharcoalToggleStyle())
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalToggle() -> some View {
        return modifier(CharcoalToggleStyleModifier())
    }
}
