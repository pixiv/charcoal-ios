import SwiftUI

public struct CharcoalSpinner: View {
    let spinnerSize: CGFloat
    let transparentBackground: Bool

    @State private var radius: CGFloat = 0
    @State private var opacity: CGFloat = 1.0

    public init(spinnerSize: CGFloat, transparentBackground: Bool) {
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
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 0)
    }

    public static func == (lhs: CharcoalSpinner, rhs: CharcoalSpinner) -> Bool {
        return lhs.transparentBackground == rhs.transparentBackground
            && lhs.spinnerSize == rhs.spinnerSize
    }
}

public struct CharcoalSpinnerModifier: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool
    let spinnerSize: CGFloat
    let transparentBackground: Bool
    let interactionPassthrough: Bool

    init(isPresenting: Binding<Bool>, spinnerSize: CGFloat, transparentBackground: Bool, interactionPassthrough: Bool) {
        _isPresenting = isPresenting
        self.spinnerSize = spinnerSize
        self.transparentBackground = transparentBackground
        self.interactionPassthrough = interactionPassthrough
    }

    public func body(content: Content) -> some View {
        content
            .overlay(ZStack {
                if isPresenting {
                    if interactionPassthrough == false {
                        // Prevent user interaction passthrough needs non-clear color
                        Color.white.opacity(0.01).contentShape(Rectangle())
                    }
                    CharcoalSpinner(
                        spinnerSize: spinnerSize,
                        transparentBackground: transparentBackground
                    )
                }
            }
            .ignoresSafeArea()
            .animation(.spring, value: isPresenting))
    }
}

public extension View {
    /**
        A view modifier that presents a Spinner view.

     By default, the spinner view is centered in the parent view and takes up all the avaliable space on parent view.

        - Parameters:
            - isPresented: A binding to whether the  view is presented.
            - spinnerSize: The size of the spinner view.
            - transparentBackground: Whether the background of the spinner view is transparent.
            - interactionPassthrough: Whether the spinner view should pass through user interactions.

        # Example #
        ```swift
        struct ContentView: View {
            @State var isPresenting = true

            var body: some View {
                VStack {
                    Button("Show Spinner") {
                        isPresenting = true
                    }
                }
                .charcoalSpinner(isPresenting: $isPresenting)
            }
        }
        ```
     */
    func charcoalSpinner(
        isPresenting: Binding<Bool>,
        spinnerSize: CGFloat = 48,
        transparentBackground: Bool = false,
        interactionPassthrough: Bool = false
    ) -> some View {
        return modifier(CharcoalSpinnerModifier(isPresenting: isPresenting, spinnerSize: spinnerSize, transparentBackground: transparentBackground, interactionPassthrough: interactionPassthrough))
    }
}

struct SpinnersPreview: View {
    @State var isPresenting = true
    @State var isBigPresenting = true
    @State var isTransparentPresenting = true

    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            VStack {
                Button {
                    isPresenting.toggle()
                } label: {
                    Text("Toggle Spinner")
                }
                VStack {}
                    .frame(width: 100, height: 100)
                    .charcoalSpinner(isPresenting: $isPresenting)

                VStack {}
                    .frame(width: 100, height: 150)
                    .charcoalSpinner(isPresenting: $isBigPresenting, spinnerSize: 100)

                VStack {}
                    .frame(width: 100, height: 100)
                    .charcoalSpinner(isPresenting: $isTransparentPresenting, transparentBackground: true)
            }
        }
        .ignoresSafeArea()
    }
}

@available(iOS 17, *)
#Preview {
    SpinnersPreview()
}
