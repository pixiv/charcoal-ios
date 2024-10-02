import SwiftUI

struct CharcoalToggleWrapper: UIViewRepresentable {
    @Binding var isOn: Bool

    func makeUIView(context: Context) -> UISwitch {
        let uiSwitch = UISwitch()
        uiSwitch.addTarget(context.coordinator, action: #selector(Coordinator.handleValueChanged(_:)), for: .valueChanged)
        return uiSwitch
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func updateUIView(_ uiView: UISwitch, context _: Context) {
        uiView.onTintColor = CharcoalFoundation.Colors.pixiv.value
        uiView.backgroundColor = CharcoalFoundation.Colors.containerNeutralDefault.value
        uiView.layer.cornerRadius = uiView.frame.size.height / 2.0
        uiView.layer.cornerCurve = .continuous
        uiView.isOn = isOn
    }

    class Coordinator: NSObject {
        var toggleWrapper: CharcoalToggleWrapper

        init(_ toggleWrapper: CharcoalToggleWrapper) {
            self.toggleWrapper = toggleWrapper
            super.init()
        }

        @objc
        func handleValueChanged(_ sender: UISwitch) {
            toggleWrapper.isOn = sender.isOn
        }
    }
}

// SwiftUIでToggleを自由にカスタマイズするのは難しいのでToggleStyleで書き換え
struct CharcoalToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            HStack {
                configuration.label
                    .charcoalTypography14Regular()
                    .charcoalText(applyToken: .default, state: .default)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                configuration.isOn = !configuration.isOn
            }
            CharcoalToggleWrapper(isOn: configuration.$isOn)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                .opacity(isEnabled ? 1.0 : 0.32)
        }
    }
}

struct CharcoalToggleStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content.toggleStyle(CharcoalToggleStyle())
    }
}

public extension View {
    func charcoalToggle() -> some View {
        return modifier(CharcoalToggleStyleModifier())
    }
}
