import SwiftUI

struct CharcoalTooltip: CharcoalPopupView {
    let text: String
    
    let targetFrame: CGRect
    
    let maxWidth: CGFloat
    
    let cornerRadius: CGFloat = 4
    
    let arrowHeight: CGFloat = 3
    
    let spacingToTarget: CGFloat = 4
    
    let spacingToScreen: CGFloat = 16
    
    @State private var tooltipSize: CGSize = .zero
    
    /// The actuall width control parameter of tooltip
    ///
    /// This will be set only when text size is greater than maxWidth to prevent SwiftUI might
    /// layout a unexpected width for the tooltip
    @State private var adaptiveMaxWidth: CGFloat?
    
    var offset: CGSize {
        CGSize(width: targetFrame.midX - (tooltipSize.width / 2.0), height: targetFrame.maxY)
    }
    
    init(text: String, targetFrame: CGRect, maxWidth: CGFloat = 184) {
        self.text = text
        self.targetFrame = targetFrame
        self.maxWidth = maxWidth
    }
    
    var animation: Animation {
        .easeOut(duration: 1)
        .repeatForever(autoreverses: false)
    }
    
    func tooltipX(canvasGeometrySize: CGSize) -> CGFloat {
        let minX = targetFrame.midX - (tooltipSize.width / 2.0)
        
        var edgeLeft = minX
        
        if (edgeLeft + tooltipSize.width >= canvasGeometrySize.width) {
            edgeLeft = canvasGeometrySize.width - tooltipSize.width - spacingToScreen
        } else if (edgeLeft < 0) {
            edgeLeft = spacingToScreen
        }
        
        return edgeLeft
    }
    
    func tooltipY(canvasGeometrySize: CGSize) -> CGFloat {
        let minX = targetFrame.maxY + spacingToTarget + arrowHeight
        var edgeBottom = targetFrame.maxY + spacingToTarget + targetFrame.height
        if edgeBottom + tooltipSize.height >= canvasGeometrySize.height {
            edgeBottom = targetFrame.minY - tooltipSize.height - spacingToTarget - arrowHeight
        }
        
        return min(minX, edgeBottom)
    }
    
    var body: some View {
        GeometryReader(content: { canvasGeometry in
            Text(text)
                .charcoalTypography12Regular()
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))
                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                .background(GeometryReader(content: { tooltipGeometry in
                    BubbleShape(
                        frameInGlobal: tooltipGeometry.frame(in: .global),
                        targetFrame: targetFrame,
                        arrowHeight: arrowHeight,
                        cornerRadius: cornerRadius
                    )
                        .fill(Color(CharcoalAsset.ColorPaletteGenerated.surface8.color))
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
    
    static func == (lhs: CharcoalTooltip, rhs: CharcoalTooltip) -> Bool {
        return lhs.text == rhs.text && lhs.targetFrame == rhs.targetFrame && lhs.maxWidth == rhs.maxWidth && lhs.tooltipSize == rhs.tooltipSize
    }
}

struct BubbleShape: Shape {
    let frameInGlobal: CGRect
    let targetFrame: CGRect
    let arrowHeight: CGFloat
    let cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let diffX = frameInGlobal.origin.x - rect.origin.x
        let targetLocalX = targetFrame.midX - diffX
        
        let diffY = frameInGlobal.origin.y - rect.origin.y
        let targetLocalY = targetFrame.midY - diffY
        
        var arrowY = rect.minY - arrowHeight
        var arrowBaseY = rect.minY + 1
        
        var arrowMaxX = min(targetLocalX + 5, rect.maxX)
        
        var arrowMinX = max(targetLocalX - 5 , rect.minX)
        
        if (targetLocalY > rect.minY) {
            arrowY = rect.maxY + arrowHeight
            arrowBaseY = rect.maxY - 1
            arrowMaxX = max(targetLocalX - 5 , rect.minX)
            arrowMinX = min(targetLocalX + 5, rect.maxX)
        }
        
        var bubblePath = RoundedRectangle(cornerRadius: cornerRadius).path(in: rect)
        let arrowPath = Path { path in
            path.move(to: CGPoint(x: arrowMaxX, y: arrowBaseY))
            path.addLine(to: CGPoint(x: arrowMinX, y: arrowBaseY))
            path.addLine(to: CGPoint(x: targetLocalX, y: arrowY))
            path.closeSubpath()
        }
        
        bubblePath.addPath(arrowPath)
        return bubblePath
    }
}

struct TooltipSizeKey: PreferenceKey {
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    static var defaultValue: CGSize = .zero
}

struct CharcoalTooltipModifier: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool
    
    var text: String
    
    @State var viewID = UUID()
    
    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader(content: { proxy in
                Color.clear
                    .modifier(CharcoalOverlayContainerChild(isPresenting: $isPresenting, view: CharcoalTooltip(text: text, targetFrame: proxy.frame(in: .global)), viewID: viewID))
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
    @State var isPresenting = true
    @State var isPresenting2 = true
    @State var isPresenting3 = true
    @State var isPresenting4 = true
    @State var isPresenting5 = true
    @State var isPresenting6 = true
    
    @State var textOfLabel = "Hello"
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView {
                ZStack(alignment: .topLeading) {
                    Color.clear
                    
                    VStack {
                        Text(textOfLabel)
                        
                        Button {
                            textOfLabel = "Changed"
                        } label: {
                            Text("Change Label")
                        }
                    }
                    
                    Button  {
                        isPresenting.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting, text: "Hello World")
                    .offset(CGSize(width: 20.0, height: 80.0))
                    
                    Button  {
                        isPresenting2.toggle()
                    } label: {
                        Text("Help")
                    }
                    .charcoalDefaultButton()
                    .charcoalTooltip(isPresenting: $isPresenting2, text: "Hello World This is a tooltip")
                    .offset(CGSize(width: 100.0, height: 150.0))
                    
                    Button  {
                        isPresenting3.toggle()
                    } label: {
                        Text("Right")
                    }
                    .charcoalPrimaryButton(size: .medium)
                    .charcoalTooltip(isPresenting: $isPresenting3, text: "here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 100, height: 100.0))
                    
                    Button  {
                        isPresenting4.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting4, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 40, height: geometry.size.height - 40))
                    
                    Button  {
                        isPresenting5.toggle()
                    } label: {
                        Text("Bottom")
                    }
                    .charcoalPrimaryButton(size: .medium)
                    .charcoalTooltip(isPresenting: $isPresenting5, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 240, height: geometry.size.height - 40))
                    
                    Button  {
                        isPresenting6.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting6, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 380, height: geometry.size.height - 240))
                    
                }
            }
        })
        .charcoalOverlayContainer()
        
    }
}

#Preview {
    TooltipsPreviewView()
}
