import SwiftUI

public struct CharcoalSpinner: View {
    let spinnerSize: CGFloat
    var transparentBackground: Bool = false

    @State private var radius: CGFloat = 0
    @State private var opacity: CGFloat = 1.0

    init(spinnerSize: CGFloat, transparentBackground: Bool) {
        self.spinnerSize = spinnerSize
        self.transparentBackground = transparentBackground
    }

    private var animation: Animation {
        .easeOut(duration: 1)
            .repeatForever(autoreverses: false)
    }

    public var body: some View {
        ZStack {
            Circle()
                .fill(Color(CharcoalAsset.ColorPaletteGenerated.surface4.color))
                .frame(width: radius, height: radius)
                .opacity(opacity)
                .onAppear {
                    withAnimation(animation) {
                        radius = spinnerSize
                        opacity = 0
                    }
                }
        }
        .frame(width: spinnerSize, height: spinnerSize)
        .padding(16)
        .background(transparentBackground ? nil : Color(CharcoalAsset.ColorPaletteGenerated.background1.color))
        .cornerRadius(8, corners: .allCorners)
    }
}

public struct CharcoalSpinnerModifier: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool
    var spinnerSize: CGFloat
    var transparentBackground: Bool = false

    private var screen: CGRect {
        return UIScreen.main.bounds
    }

    public func body(content: Content) -> some View {
        content
            .overlay(ZStack {
                if isPresenting {
                    CharcoalSpinner(
                        spinnerSize: spinnerSize,
                        transparentBackground: transparentBackground
                    )
                }
            }
                .frame(maxWidth: screen.width, maxHeight: screen.height)
                .ignoresSafeArea()
                .animation(.spring, value: isPresenting)
            )
    }
}

public extension View {
    func charcoalSpinner(
        isPresenting: Binding<Bool>,
        spinnerSize: CGFloat = 48,
        transparentBackground: Bool = false
    ) -> some View {
        return modifier(CharcoalSpinnerModifier(
            isPresenting: isPresenting,
            spinnerSize: spinnerSize,
            transparentBackground: transparentBackground
        ))
    }
}

@available(iOS 17, *)
#Preview {
    @State var isPresenting = true

    return ZStack {
        Color.gray
        VStack {
            Button {
                isPresenting.toggle()
            } label: {
                Text("Regular")
            }.charcoalSpinner(isPresenting: $isPresenting)

            Button {
                isPresenting.toggle()
            } label: {
                Text("Big")
            }.charcoalSpinner(isPresenting: $isPresenting, spinnerSize: 100)
            
            Button {
                isPresenting.toggle()
            } label: {
                Text("Transparent")
            }.charcoalSpinner(isPresenting: $isPresenting, transparentBackground: true)
        }
    }.ignoresSafeArea()
}
