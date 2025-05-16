import SwiftUI

struct CharcoalFullScreenCoverViewModifier<SubContent: View>: ViewModifier {
    @Binding var isPresented: Bool

    @ViewBuilder var subContent: () -> SubContent

    var duration: Double

    @State var hostingViewController: UIHostingController<SubContent>? = nil

    init(isPresented: Binding<Bool>, duration: Double, @ViewBuilder subContent: @escaping () -> SubContent) {
        _isPresented = isPresented
        self.subContent = subContent
        self.duration = duration
    }

    func body(content: Content) -> some View {
        content
            .onChange(of: isPresented) { newValue in
                UIView.setAnimationsEnabled(false)
            }
            .fullScreenCover(isPresented: $isPresented) {
                subContent()
                    .background(ClearBackgroundView())
            }
            .onAppear {
                if !UIView.areAnimationsEnabled {
                    UIView.setAnimationsEnabled(true)
                }
            }
            .onDisappear {
                if !UIView.areAnimationsEnabled {
                    UIView.setAnimationsEnabled(true)
                }
            }
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()

            superview?.superview?.backgroundColor = .clear
        }
    }
}

extension View {
    func charcoalFullScreenCover<SubContent: View>(isPresented: Binding<Bool>, duration: Double = 0.25, @ViewBuilder content: @escaping () -> SubContent) -> some View {
        modifier(CharcoalFullScreenCoverViewModifier(isPresented: isPresented, duration: duration, subContent: content))
    }
}
