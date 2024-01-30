import SwiftUI

public struct CharcoalTooltip: CharcoalPopupView {
    let text: String
    let targetFrame: CGRect
    let maxWidth: CGFloat

    public init(text: String, targetFrame: CGRect, maxWidth: CGFloat = 184) {
        self.text = text
        self.targetFrame = targetFrame
        self.maxWidth = maxWidth
    }

    private var animation: Animation {
        .easeOut(duration: 1)
            .repeatForever(autoreverses: false)
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            Color.clear
            ZStack {
                Text(text)
                    .charcoalTypography12Regular()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            }
            .frame(maxWidth: maxWidth)
            .background(Color(CharcoalAsset.ColorPaletteGenerated.surface8.color))
            .cornerRadius(4, corners: .allCorners)
            .offset(CGSize(width: targetFrame.maxX - (targetFrame.width / 2.0), height: targetFrame.maxY))
        }
    }
}

public struct CharcoalTooltipModifier: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool
    
    var text: String

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
    func charcoalTooltip(
        isPresenting: Binding<Bool>,
        text: String
    ) -> some View {
        return modifier(CharcoalTooltipModifier(isPresenting: isPresenting, text: text))
    }
}

#Preview {
    CharcoalTooltip(text: "Hellow World This is a tooltip and here is testing it's multiple line feature", targetFrame: CGRect(x: 0, y: 100, width: 100, height: 100))
}
