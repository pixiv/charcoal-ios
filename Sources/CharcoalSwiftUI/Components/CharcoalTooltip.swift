import SwiftUI

public struct CharcoalTooltip: CharcoalPopupView {
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
        let minX = targetFrame.midX - (tooltipSize.width / 2.0)
        
        var edgeLeft = minX
        
        if (edgeLeft + tooltipSize.width >= canvasGeometrySize.width) {
            edgeLeft = canvasGeometrySize.width - tooltipSize.width
        } else if (edgeLeft < 0) {
            edgeLeft = 0
        }
        
        return edgeLeft
    }
    
    func tooltipY(canvasGeometrySize: CGSize) -> CGFloat {
        let minX = targetFrame.maxY + spacingToTarget
        var edgeBottom = targetFrame.maxY + spacingToTarget + targetFrame.height
        
        if edgeBottom >= canvasGeometrySize.height {
            edgeBottom = targetFrame.minY - tooltipSize.height - spacingToTarget
        }
        
        return min(minX, edgeBottom)
    }
    
    @State private var adaptiveMaxWidth: CGFloat?
    
    public var body: some View {
        GeometryReader(content: { canvasGeometry in
            Text(text)
                .charcoalTypography12Regular()
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))
                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .background(GeometryReader(content: { tooltipGeometry in
                Color(CharcoalAsset.ColorPaletteGenerated.surface8.color)            .cornerRadius(4, corners: .allCorners)
                    .preference(key: TooltipSizeKey.self, value: tooltipGeometry.size)
            }))
            .frame(maxWidth: adaptiveMaxWidth)
            .offset(CGSize(
                width: tooltipX(canvasGeometrySize: canvasGeometry.size),
                height: tooltipY(canvasGeometrySize: canvasGeometry.size)))
            .onPreferenceChange(TooltipSizeKey.self, perform: { value in
                tooltipSize = value
                if (adaptiveMaxWidth == nil) {
                    adaptiveMaxWidth = tooltipSize.width < maxWidth ? nil : maxWidth
                }
            })
            .animation(.none, value: tooltipSize)
            .animation(.none, value: targetFrame)
        })
    }
    
    public static func == (lhs: CharcoalTooltip, rhs: CharcoalTooltip) -> Bool {
        return lhs.text == rhs.text && lhs.targetFrame == rhs.targetFrame && lhs.maxWidth == rhs.maxWidth && lhs.tooltipSize == rhs.tooltipSize
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
                EmptyView()
                    .modifier(CharcoalOverlayContainerChild(isPresenting: $isPresenting, view: CharcoalTooltip(text: text, targetFrame: proxy.frame(in: .global))))
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
        GeometryReader(content: { geometry in
            ScrollView {
                ZStack(alignment: .topLeading) {
                    Color.clear
                    
                    Button  {
                        isPresenting.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting, text: "Hello World ")
                    .offset(CGSize(width: 20.0, height: 80.0))
                    
                    Button  {
                        isPresenting2.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting2, text: "Hello World This is a tooltip")
                    .offset(CGSize(width: 100.0, height: 100.0))
                    
                    Button  {
                        isPresenting3.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting3, text: "here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 30, height: 100.0))
                    
                    Button  {
                        isPresenting4.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting4, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 40, height: geometry.size.height - 40))
                    
                }
            }
        })
        .ignoresSafeArea()
        .charcoalOverlayContainer()
    }
}

#Preview {
    TooltipsPreviewView()
}
