import SwiftUI

public enum CharcoalToggleStyle {
    case `default`
}

struct CharcoalToggleWrapper: UIViewRepresentable {
    @Binding var isOn: Bool

    func makeUIView(context: Context) -> UISwitch {
        let uiSwitch = UISwitch()
        uiSwitch.addTarget(context.coordinator, action: #selector(Coordinator.handleValueChanged(_:)), for: .valueChanged)
        uiSwitch.onTintColor = CharcoalAsset.ColorPaletteGenerated.brand.color
        uiSwitch.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface4.color
        uiSwitch.layer.cornerRadius = uiSwitch.frame.size.height / 2.0
        uiSwitch.layer.cornerCurve = .continuous
        return uiSwitch
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func updateUIView(_ uiView: UISwitch, context _: Context) {
        if uiView.isOn != isOn {
            uiView.setOn(isOn, animated: true)
        }
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
private struct CharcoalDefaultToggleStyle: ToggleStyle {
    @Environment(\.isEnabled) var isEnabled

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            HStack {
                configuration.label
                    .font(charcoalSize: .the14, weight: .regular)
                    .foregroundStyle(charcoalColor: .text1)
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

extension CharcoalToggleStyle: ToggleStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        switch self {
        case .default:
            CharcoalDefaultToggleStyle().makeBody(configuration: configuration)
        }
    }
}

public extension ToggleStyle where Self == CharcoalToggleStyle {
    static var charcoalDefault: Self {
        .default
    }
}

public extension View {
    @available(*, deprecated, message: "Use toggleStyle(_:) with CharcoalToggleStyle instead.")
    func charcoalToggle() -> some View {
        return toggleStyle(.charcoalDefault)
    }
}
