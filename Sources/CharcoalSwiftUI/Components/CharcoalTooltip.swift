import SwiftUI

public struct CharcoalTooltip: CharcoalPopupView {
    let text: String
    let targetFrame: CGRect

    public init(text: String, targetFrame: CGRect) {
        self.text = text
        self.targetFrame = targetFrame
    }

    private var animation: Animation {
        .easeOut(duration: 1)
            .repeatForever(autoreverses: false)
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            ZStack {
                Text(text).foregroundColor(Color.white).padding()
            }
            .background(Color(CharcoalAsset.ColorPaletteGenerated.brand.color))
            .cornerRadius(8, corners: .allCorners)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 0)
            .offset(CGSize(width: targetFrame.maxX - (targetFrame.width / 2.0), height: targetFrame.maxY))
        }
    }
}

public struct CharcoalTooltipModifier: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool
    
    var text: String

    private var screen: CGRect {
        return UIScreen.main.bounds
    }

    public func body(content: Content) -> some View {
        content
            .overlay(GeometryReader(content: { proxy in
                let frame = proxy.frame(in: .global)
                EmptyView()
                    .modifier(CharcoalOverlayContainerChild(isPresenting: $isPresenting, view: CharcoalTooltip(text: text, targetFrame: frame)))
            }))
    }
}

public extension View {
    func charcoalTooltipGlobal(
        isPresenting: Binding<Bool>,
        text: String
    ) -> some View {
        return modifier(CharcoalTooltipModifier(isPresenting: isPresenting, text: text))
    }
}
