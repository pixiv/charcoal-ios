import SwiftUI

public struct CharcoalTooltip: CharcoalPopupView {
    public static func == (lhs: CharcoalTooltip, rhs: CharcoalTooltip) -> Bool {
        return lhs.text == rhs.text && lhs.targetFrame == rhs.targetFrame && lhs.maxWidth == rhs.maxWidth
    }
    
    let text: String
    let targetFrame: CGRect
    let maxWidth: CGFloat
    
    let spacingToTarget: CGFloat = 5
    
    @State private var tooltipSize: CGSize = .zero
    
    private var offset: CGSize {
        CGSize(width: targetFrame.midX - (tooltipSize.width / 2.0), height: targetFrame.maxY)
    }
    
    public init(text: String, targetFrame: CGRect, maxWidth: CGFloat = 184) {
        self.text = text
        self.targetFrame = targetFrame
        self.maxWidth = maxWidth
    }
    
    private var animation: Animation {
        .easeOut(duration: 1)
        .repeatForever(autoreverses: false)
    }
    
    func tooltipX(canvasGeometrySize: CGSize) -> CGFloat {
//        print("targetFrameMidX \(targetFrame.midX) tooltipWidth \(tooltipSize.width)")
        let minX = targetFrame.midX - (tooltipSize.width / 2.0)
//        print("tooltipX \(max(0, minX))")
        let edgeLeft = max(0, minX)
        let edgeRight = min(edgeLeft, canvasGeometrySize.width - tooltipSize.width)
//        print("edgeLeft \(edgeLeft) edgeRight \(edgeRight)")
        return min(edgeLeft, edgeRight)
    }
    
    func tooltipY(canvasGeometrySize: CGSize) -> CGFloat {
        print("targetFrameMidX \(targetFrame.midX) tooltipHeight \(tooltipSize.height)")
        let minX = targetFrame.maxY + spacingToTarget
        let edgeBottom = canvasGeometrySize.height - tooltipSize.height - targetFrame.height - spacingToTarget
        print("edgeBottom \(edgeBottom)")
        return min(minX, edgeBottom)
    }
    
    public var body: some View {
        GeometryReader(content: { canvasGeometry in
            VStack {
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
            .overlay(
                GeometryReader(content: { tooltipGeometry in
                    Color.clear.preference(key: TooltipSizeKey.self, value: tooltipGeometry.size)
                })
            )
            .onPreferenceChange(TooltipSizeKey.self, perform: { value in
                DispatchQueue.main.async {
                    tooltipSize = value
                }
                print("canvasGeometry \(canvasGeometry.size) tooltipSize \(tooltipSize)")
            })
            .offset(CGSize(
                width: tooltipX(canvasGeometrySize: canvasGeometry.size),
                height: tooltipY(canvasGeometrySize: canvasGeometry.size)))
            .animation(.none, value: tooltipSize)
            .animation(.none, value: targetFrame)
        })
    }
}

struct TooltipSizeKey: PreferenceKey {
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    static var defaultValue: CGSize = .zero
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

private struct TooltipsPreviewView: View {
    @State var isPresenting = false
    @State var isPresenting2 = false
    @State var isPresenting3 = false
    @State var isPresenting4 = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader(content: { geometry in
                Button  {
                    isPresenting.toggle()
                } label: {
                    Image(charocalIcon: .question24)
                }
                .charcoalTooltip(isPresenting: $isPresenting, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                .offset(CGSize(width: 20.0, height: 20.0))
                
                Button  {
                    isPresenting2.toggle()
                } label: {
                    Image(charocalIcon: .question24)
                }
                .charcoalTooltip(isPresenting: $isPresenting2, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                .offset(CGSize(width: 100.0, height: 100.0))
                
                Button  {
                    isPresenting3.toggle()
                } label: {
                    Image(charocalIcon: .question24)
                }
                .charcoalTooltip(isPresenting: $isPresenting3, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                .offset(CGSize(width: geometry.size.width - 30, height: 100.0))
                
                Button  {
                    isPresenting4.toggle()
                } label: {
                    Image(charocalIcon: .question24)
                }
                .charcoalTooltip(isPresenting: $isPresenting4, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                .offset(CGSize(width: geometry.size.width - 40, height: geometry.size.height - 40))
            })
        }
        .ignoresSafeArea()
        .charcoalOverlayContainer()
    }
}

#Preview {
    TooltipsPreviewView()
}
