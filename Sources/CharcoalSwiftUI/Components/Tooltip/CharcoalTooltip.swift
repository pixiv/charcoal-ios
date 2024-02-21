import SwiftUI

struct CharcoalTooltip: CharcoalPopupView {
    /// The text of the tooltip
    let text: String

    /// The frame of the target view which the arrow will point to
    let targetFrame: CGRect

    /// The maximum width of the tooltip
    let maxWidth: CGFloat

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 4

    /// The height of the arrow
    let arrowHeight: CGFloat = 3

    /// The spacing between the tooltip and the target view
    let spacingToTarget: CGFloat = 4

    /// The spacing between the tooltip and the screen edge
    let spacingToScreen: CGFloat = 16

    @State private var tooltipSize: CGSize = .zero

    var offset: CGSize {
        CGSize(width: targetFrame.midX - (tooltipSize.width / 2.0), height: targetFrame.maxY)
    }

    init(text: String, targetFrame: CGRect, maxWidth: CGFloat = 184) {
        self.text = text
        self.targetFrame = targetFrame
        self.maxWidth = maxWidth
    }

    func tooltipX(canvasGeometrySize: CGSize) -> CGFloat {
        let minX = targetFrame.midX - (tooltipSize.width / 2.0)

        var edgeLeft = minX

        if edgeLeft + tooltipSize.width >= canvasGeometrySize.width {
            edgeLeft = canvasGeometrySize.width - tooltipSize.width - spacingToScreen
        } else if edgeLeft < spacingToScreen {
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
            VStack {
                Text(text)
                    .charcoalTypography12Regular()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                    .background(GeometryReader(content: { tooltipGeometry in
                        let tooltipOrigin = tooltipGeometry.frame(in: .global).origin
                        TooltipBubbleShape(
                            targetPoint:
                            CGPoint(
                                x: targetFrame.midX - tooltipOrigin.x,
                                y: targetFrame.maxY - tooltipOrigin.y
                            ),
                            arrowHeight: arrowHeight,
                            cornerRadius: cornerRadius
                        )
                        .fill(Color(CharcoalAsset.ColorPaletteGenerated.surface8.color))
                        .preference(key: TooltipSizeKey.self, value: tooltipGeometry.size)
                    }))
                    .offset(CGSize(
                        width: tooltipX(canvasGeometrySize: canvasGeometry.size),
                        height: tooltipY(canvasGeometrySize: canvasGeometry.size)
                    ))
                    .onPreferenceChange(TooltipSizeKey.self, perform: { value in
                        tooltipSize = value
                    })
                    .animation(.none, value: tooltipSize)
                    .animation(.none, value: targetFrame)
            }.frame(minWidth: 0, maxWidth: maxWidth, alignment: .leading)
        })
    }

    static func == (lhs: CharcoalTooltip, rhs: CharcoalTooltip) -> Bool {
        return lhs.text == rhs.text && lhs.targetFrame == rhs.targetFrame && lhs.maxWidth == rhs.maxWidth && lhs.tooltipSize == rhs.tooltipSize
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

    /// Text to be displayed in the tooltip
    var text: String

    /// Assign a unique ID to the view
    @State var viewID = UUID()

    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader(content: { proxy in
                Color.clear
                    .modifier(CharcoalOverlayContainerChild(
                        isPresenting: $isPresenting,
                        dismissOnTouchOutside: true, 
                        view: CharcoalTooltip(
                            text: text,
                            targetFrame: proxy.frame(in: .global)),
                        viewID: viewID))
            }))
    }
}

public extension View {
    /**
     Add a tooltip to the view

     - Parameters:
        - isPresenting: A binding to whether the Tooltip  is presented.
        - text: The text to be displayed in the tooltip.

     # Example #
     ```swift
     Text("Hello").charcoalTooltip(isPresenting: $isPresenting, text: "This is a tooltip")
     ```
     */
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
                            textOfLabel = ["Changed", "Hello"].randomElement()!
                        } label: {
                            Text("Change Label")
                        }
                    }

                    Button {
                        isPresenting.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting, text: "Hello World")
                    .offset(CGSize(width: 20.0, height: 80.0))

                    Button {
                        isPresenting2.toggle()
                    } label: {
                        Text("Help")
                    }
                    .charcoalDefaultButton()
                    .charcoalTooltip(isPresenting: $isPresenting2, text: "Hello World This is a tooltip")
                    .offset(CGSize(width: 100.0, height: 150.0))

                    Button {
                        isPresenting3.toggle()
                    } label: {
                        Text("Right")
                    }
                    .charcoalPrimaryButton(size: .medium)
                    .charcoalTooltip(isPresenting: $isPresenting3, text: "here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 100, height: 100.0))

                    Button {
                        isPresenting4.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalTooltip(isPresenting: $isPresenting4, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 30, height: geometry.size.height - 40))

                    Button {
                        isPresenting5.toggle()
                    } label: {
                        Text("Bottom")
                    }
                    .charcoalPrimaryButton(size: .medium)
                    .charcoalTooltip(isPresenting: $isPresenting5, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 240, height: geometry.size.height - 40))

                    Button {
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
