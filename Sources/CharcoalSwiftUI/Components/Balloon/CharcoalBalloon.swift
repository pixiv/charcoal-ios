import SwiftUI

struct CharcoalBalloon<ActionContent: View>: CharcoalPopupProtocol, CharcoalToastActionable {
    typealias IDValue = UUID

    /// The unique ID of the overlay.
    let id: IDValue
    /// The text of the tooltip
    let text: String

    /// The frame of the target view which the arrow will point to
    let targetFrame: CGRect

    /// The maximum width of the tooltip
    let maxWidth: CGFloat

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 16

    /// The height of the arrow
    let arrowHeight: CGFloat = 4

    /// The spacing between the tooltip and the target view
    let spacingToTarget: CGFloat = 4

    /// The spacing between the tooltip and the screen edge
    let spacingToScreen: CGFloat = 16

    @State private var tooltipSize: CGSize = .zero

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool

    /// If true, the overlay will be dismissed when the user taps outside of the overlay.
    let dismissOnTouchOutside: Bool

    /// The overlay will be dismissed after a certain time interval.
    let dismissAfter: TimeInterval?

    let action: ActionContent?

    @State var timer: Timer?

    init(
        id: IDValue,
        text: String,
        targetFrame: CGRect,
        maxWidth: CGFloat = 240,
        isPresenting: Binding<Bool>,
        dismissOnTouchOutside: Bool = false,
        dismissAfter: TimeInterval? = nil,
        @ViewBuilder action: () -> ActionContent?
    ) {
        self.id = id
        self.text = text
        self.targetFrame = targetFrame
        self.maxWidth = maxWidth
        _isPresenting = isPresenting
        self.dismissOnTouchOutside = dismissOnTouchOutside
        self.dismissAfter = dismissAfter
        self.action = action()
    }

    /// Calculate the position of the tooltip
    func positionOfOverlay(canvasGeometrySize: CGSize) -> CGSize {
        // Check avaliable area for each direction, compare area size with tooltip size.
        // The priorty is Bottom > Top > Right > Left
        var priorities: [LayoutPriority] = []

        // Calculate layout it by sides
        let rightWidth = canvasGeometrySize.width - targetFrame.maxX - spacingToScreen - arrowHeight
        let rightHeight = canvasGeometrySize.height - targetFrame.height
        priorities.append(LayoutPriority(priority: .right, spaceArea: CGSize(width: rightWidth, height: rightHeight)))

        let leftWidth = targetFrame.minX - spacingToScreen - arrowHeight
        let leftHeight = canvasGeometrySize.height - targetFrame.height
        priorities.append(LayoutPriority(priority: .left, spaceArea: CGSize(width: leftWidth, height: leftHeight)))

        // Calculate layout it by top and bottom
        let bottomHeight = canvasGeometrySize.height - targetFrame.maxY - spacingToScreen - spacingToTarget - arrowHeight
        let buttonWidth = canvasGeometrySize.width - spacingToScreen * 2
        priorities.append(LayoutPriority(priority: .bottom, spaceArea: CGSize(width: buttonWidth, height: bottomHeight)))

        let topHeight = targetFrame.minY - spacingToScreen - arrowHeight - spacingToTarget
        let topWidth = canvasGeometrySize.width - spacingToScreen * 2
        priorities.append(LayoutPriority(priority: .top, spaceArea: CGSize(width: topWidth, height: topHeight)))

        let tooltipRect = CGRect(x: 0, y: 0, width: tooltipSize.width, height: tooltipSize.height)

        // Get the ideal layout plan
        let layoutPlan = priorities.first(where: { $0.spaceArea.width >= tooltipSize.width && $0.spaceArea.height >= tooltipSize.height }) ?? priorities.sorted(by: { $0.rect.intersectionArea(tooltipRect) > $1.rect.intersectionArea(tooltipRect) }).first!

        switch layoutPlan.priority {
        case .bottom:
            return CGSize(width: tooltipX(canvasGeometrySize: canvasGeometrySize), height: targetFrame.maxY + spacingToTarget + arrowHeight)
        case .top:
            return CGSize(width: tooltipX(canvasGeometrySize: canvasGeometrySize), height: targetFrame.minY - spacingToTarget - tooltipSize.height - arrowHeight)
        case .right:
            return CGSize(width: targetFrame.maxX + spacingToTarget + arrowHeight, height: targetFrame.midY - tooltipSize.height / 2.0)
        case .left:
            return CGSize(width: targetFrame.minX - tooltipSize.width - spacingToTarget - arrowHeight, height: targetFrame.midY - tooltipSize.height / 2.0)
        }
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

    var body: some View {
        ZStack {
            Color.clear
                .if(dismissOnTouchOutside && isPresenting) { view in
                    view.contentShape(Rectangle())
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    isPresenting = false
                                }
                        )
                        .simultaneousGesture(
                            DragGesture()
                                .onChanged { _ in
                                    isPresenting = false
                                }
                        )
                }
            if isPresenting {
                GeometryReader(content: { canvasGeometry in
                    ZStack {
                        VStack {
                            HStack(alignment: .firstTextBaseline, spacing: 5) {
                                Text(text)
                                    .charcoalTypography14Bold()
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text5.color))

                                Image(charocalIcon: .remove16)
                                    .renderingMode(.template)
                                    .foregroundColor(Color.white)
                                    .frame(width: 16 + 6)
                                    .background(Circle()
                                        .fill(Color.black.opacity(0.35))
                                        .frame(width: 16 + 6, height: 16 + 6))
                                    .overlay(
                                        EmptyView().frame(width: 45, height: 45)
                                            .contentShape(Rectangle()).onTapGesture {
                                                isPresenting = false
                                            })
                            }

                            if let action = action {
                                action
                                    .charcoalTypography14Bold()
                                    .padding(EdgeInsets(top: 3, leading: 16, bottom: 3, trailing: 16))
                                    .background(Capsule()
                                        .fill(Color.black.opacity(0.35)))
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                        .background(GeometryReader(content: { tooltipGeometry in
                            let tooltipOrigin = tooltipGeometry.frame(in: .global).origin
                            TooltipBubbleShape(
                                targetPoint:
                                CGPoint(
                                    x: targetFrame.midX - tooltipOrigin.x,
                                    y: targetFrame.midY - tooltipOrigin.y
                                ),
                                arrowHeight: arrowHeight,
                                cornerRadius: cornerRadius,
                                arrowWidth: 7
                            )
                            .fill(Color(CharcoalAsset.ColorPaletteGenerated.brand.color), strokeColor: Color.white, lineWidth: 2)
                        }))
                        .overlay(GeometryReader(content: { tooltipGeometry in
                            // GeometryReader size is zero in background, so we use overlay instead
                            Color.clear.preference(key: TooltipSizeKey.self, value: tooltipGeometry.size)
                        }))
                        .offset(positionOfOverlay(canvasGeometrySize: canvasGeometry.size))
                        .onPreferenceChange(TooltipSizeKey.self, perform: { value in
                            tooltipSize = value
                        })
                        .animation(.none, value: tooltipSize)
                        .animation(.none, value: targetFrame)
                    }
                    .frame(minWidth: 0, maxWidth: maxWidth, alignment: .leading)
                })
                .onAppear {
                    if let dismissAfter = dismissAfter {
                        timer = Timer.scheduledTimer(withTimeInterval: dismissAfter, repeats: false, block: { _ in
                            isPresenting = false
                        })
                    }
                }
                .onDisappear {
                    timer?.invalidate()
                }
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isPresenting)
    }

    static func == (lhs: CharcoalBalloon, rhs: CharcoalBalloon) -> Bool {
        return lhs.text == rhs.text && lhs.targetFrame == rhs.targetFrame && lhs.maxWidth == rhs.maxWidth && lhs.tooltipSize == rhs.tooltipSize
    }
}

struct CharcoalBalloonModifier<ActionContent: View>: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool

    /// Text to be displayed in the tooltip
    var text: String

    /// Assign a unique ID to the view
    @State var viewID = UUID()

    /// The overlay will be dismissed after a certain time interval.
    let dismissAfter: TimeInterval?

    @ViewBuilder let action: () -> ActionContent?

    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader(content: { proxy in
                Color.clear
                    .modifier(CharcoalOverlayUpdaterContainer(
                        isPresenting: $isPresenting,
                        view: CharcoalBalloon(
                            id: viewID,
                            text: text,
                            targetFrame: proxy.frame(in: .global),
                            isPresenting: $isPresenting,
                            dismissAfter: dismissAfter,
                            action: action
                        ),
                        viewID: viewID
                    ))
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
    func charcoalBalloon<Content: View>(
        isPresenting: Binding<Bool>,
        text: String,
        dismissAfter: TimeInterval? = nil,
        @ViewBuilder action: @escaping () -> Content = { EmptyView() }
    ) -> some View {
        return modifier(CharcoalBalloonModifier(isPresenting: isPresenting, text: text, dismissAfter: dismissAfter, action: action))
    }
}

private struct BalloonsPreviewView: View {
    @State var isPresenting = true
    @State var isPresenting2 = true
    @State var isPresenting3 = true
    @State var isPresenting4 = true
    @State var isPresenting5 = true
    @State var isPresenting6 = true

    @State var textOfLabel = "Hello"

    var body: some View {
        GeometryReader(content: { geometry in
            Color.gray.opacity(0.1)
            ScrollView {
                ZStack(alignment: .topLeading) {
                    Color.clear
//                    VStack {
//                        Text(textOfLabel)
//
//                        Button {
//                            textOfLabel = ["Changed", "Hello"].randomElement()!
//                        } label: {
//                            Text("Change Label")
//                        }
//                    }

                    Button {
                        isPresenting.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalBalloon(
                        isPresenting: $isPresenting,
                        text: "作品中の特定単語について"
                    )
                    .offset(CGSize(width: 20.0, height: 80.0))

                    Button {
                        isPresenting2.toggle()
                    } label: {
                        Text("Help")
                    }
                    .charcoalDefaultButton()
                    .charcoalBalloon(isPresenting: $isPresenting2, text: "作品中の特定単語について、単語変換をして読めるようになりました") {
                        Button(action: {}, label: {
                            Text("詳しく")
                        })
                    }

                    .offset(CGSize(width: 100.0, height: 150.0))

                    Button {
                        isPresenting3.toggle()
                    } label: {
                        Text("Right")
                    }
                    .charcoalPrimaryButton(size: .medium)
                    .charcoalBalloon(isPresenting: $isPresenting3, text: "here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 100, height: 100.0))

                    Button {
                        isPresenting4.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalBalloon(isPresenting: $isPresenting4, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 30, height: geometry.size.height - 40))

                    Button {
                        isPresenting5.toggle()
                    } label: {
                        Text("Bottom")
                    }
                    .charcoalPrimaryButton(size: .medium)
                    .charcoalBalloon(
                        isPresenting: $isPresenting5,
                        text: "Hello World This is a tooltip and here is testing it's multiple line feature",
                        dismissAfter: 2
                    )
                    .offset(CGSize(width: geometry.size.width - 240, height: geometry.size.height - 40))

                    Button {
                        isPresenting6.toggle()
                    } label: {
                        Image(charocalIcon: .question24)
                    }
                    .charcoalBalloon(isPresenting: $isPresenting6, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
                    .offset(CGSize(width: geometry.size.width - 380, height: geometry.size.height - 240))
                }
            }
        })
        .charcoalOverlayContainer()
    }
}

#Preview {
    BalloonsPreviewView()
}
