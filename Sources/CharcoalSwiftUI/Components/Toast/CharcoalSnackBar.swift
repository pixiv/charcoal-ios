import SwiftUI

struct CharcoalSnackBar<ActionContent: View>: CharcoalPopupProtocol, CharcoalToastBase, CharcoalToastActionable, CharcoalToastDraggable {
    typealias IDValue = UUID

    let id: IDValue

    let text: String

    /// The thumbnail image of the snackbar
    let thumbnailImage: Image?

    let maxWidth: CGFloat

    let cornerRadius: CGFloat = 32

    let borderColor: Color

    let borderLineWidth: CGFloat = 1

    let screenEdge: CharcoalPopupViewEdge

    let screenEdgeSpacing: CGFloat

    /// The content of the action view
    let action: ActionContent?

    @State private var tooltipSize: CGSize = .zero

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool

    let dismissAfter: TimeInterval?

    @State var isActuallyPresenting: Bool = false

    var animationConfiguration: CharcoalToastAnimationConfiguration
    
    @State internal var offset = CGSize.zero
    
    @State internal var dragVelocity = CGSize.zero
    
    @State internal var isDragging = false

    init(
        id: IDValue,
        text: String,
        maxWidth: CGFloat = 312,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat,
        thumbnailImage: Image?,
        @ViewBuilder action: () -> ActionContent?,
        isPresenting: Binding<Bool>,
        dismissAfter: TimeInterval? = nil,
        animationConfiguration: CharcoalToastAnimationConfiguration = .default
    ) {
        self.id = id
        self.text = text
        self.maxWidth = maxWidth
        self.thumbnailImage = thumbnailImage
        self.action = action()
        self.screenEdgeSpacing = screenEdgeSpacing
        _isPresenting = isPresenting
        self.dismissAfter = dismissAfter
        self.screenEdge = screenEdge
        self.animationConfiguration = animationConfiguration
        self.borderColor = Color(CharcoalAsset.ColorPaletteGenerated.border.color)
    }

    var body: some View {
        ZStack(alignment: screenEdge.alignment) {
            Color.clear
            HStack(spacing: 0) {
                if let thumbnailImage = thumbnailImage {
                    thumbnailImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                }
                HStack(spacing: 16) {
                    Text(text)
                        .charcoalTypography14Bold(isSingleLine: true)
                        .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text1.color))

                    if let action = action {
                        action
                            .charcoalDefaultButton(size: .small)
                    }
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            }
            .background(
                Color(CharcoalAsset.ColorPaletteGenerated.background1.color)
            )
            .charcoalAnimatableToast(
                isPresenting: $isPresenting,
                isActuallyPresenting: $isActuallyPresenting,
                isDragging: $isDragging,
                tooltipSize: $tooltipSize,
                cornerRadius: cornerRadius,
                borderColor: borderColor,
                borderLineWidth: borderLineWidth,
                screenEdge: screenEdge,
                screenEdgeSpacing: screenEdgeSpacing,
                dismissAfter: dismissAfter,
                animationConfiguration: animationConfiguration
            )
            .offset(y: offset.height)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        let translationInDirection = gesture.translation.height*screenEdge.direction
                        dragVelocity = gesture.velocity
                        
                        isDragging = true
                        if (translationInDirection < 0) {
                            offset = CGSize(width: 0,
                                            height: gesture.translation.height)
                        } else {
                            // the less the faster resistance
                            let limit: CGFloat = 60
                            let yOff = gesture.translation.height
                            let dist = sqrt(yOff*yOff)
                            let factor = 1 / (dist / limit + 1)
                            
                            offset = CGSize(width: 0,
                                            height: gesture.translation.height * factor)
                        }
                    }
                    .onEnded { _ in
                        isDragging = false
                        let movingVelocityInDirection = dragVelocity.height * screenEdge.direction
                        let offsetInDirection = offset.height * screenEdge.direction
                        
                        if offsetInDirection < -50 || movingVelocityInDirection < -100 {
                            // remove the card
                            isPresenting = false
                            let animation = Animation.interpolatingSpring(initialVelocity: dragVelocity.height)
                            withAnimation(animation) {
                                offset = .zero
                            }
                        } else {
                            withAnimation(.bouncy) {
                                offset = .zero
                            }
                        }
                    }
            )
        }
        .frame(minWidth: 0, maxWidth: maxWidth, alignment: .center)
    }

    static func == (lhs: CharcoalSnackBar, rhs: CharcoalSnackBar) -> Bool {
        return lhs.text == rhs.text && lhs.maxWidth == rhs.maxWidth && lhs.thumbnailImage == rhs.thumbnailImage && lhs.isPresenting == rhs.isPresenting
    }
}

struct CharcoalSnackBarModifier<ActionContent: View>: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool

    /// The edge of the screen where the snackbar will be presented
    let screenEdge: CharcoalPopupViewEdge

    /// The spacing between the snackbar and the screen edge
    let screenEdgeSpacing: CGFloat

    /// Text to be displayed in the snackbar
    let text: String

    /// The thumbnail image to be displayed in the snackbar
    let thumbnailImage: Image?

    /// The action to be displayed in the snackbar
    @ViewBuilder let action: () -> ActionContent?

    /// Assign a unique ID to the view
    @State var viewID = UUID()

    /// The overlay will be dismissed after a certain time interval.
    let dismissAfter: TimeInterval?

    func body(content: Content) -> some View {
        content
            .overlay(Color.clear
                .modifier(
                    CharcoalOverlayUpdaterContainer(
                        isPresenting: $isPresenting,

                        view: CharcoalSnackBar(
                            id: viewID,
                            text: text,
                            screenEdge: screenEdge,
                            screenEdgeSpacing: screenEdgeSpacing,
                            thumbnailImage: thumbnailImage,
                            action: action,
                            isPresenting: $isPresenting,
                            dismissAfter: dismissAfter
                        ),
                        viewID: viewID
                    )))
    }
}

public extension View {
    /**
     Add a tooltip to the view

     - Parameters:
        - isPresenting: A binding to whether the Tooltip  is presented.
        - text: The text to be displayed in the snackbar.
        - thumbnailImage: The thumbnail image to be displayed in the snackbar.
        - dismissAfter: The overlay will be dismissed after a certain time interval.
        - screenEdge: The edge of the screen where the snackbar will be presented
        - screenEdgeSpacing: The spacing between the snackbar and the screen edge
        - action: The action to be displayed in the snackbar.

     # Example #
     ```swift
     Text("Hello").charcoalSnackBar(isPresenting: $isPresenting, text: "Hello")
     ```
     */
    func charcoalSnackBar<Content>(
        isPresenting: Binding<Bool>,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat = 96,
        text: String,
        thumbnailImage: Image? = nil,
        dismissAfter: TimeInterval? = nil,
        @ViewBuilder action: @escaping () -> Content = { EmptyView() }
    ) -> some View where Content: View {
        return modifier(
            CharcoalSnackBarModifier(
                isPresenting: isPresenting,
                screenEdge: screenEdge,
                screenEdgeSpacing: screenEdgeSpacing,
                text: text,
                thumbnailImage: thumbnailImage,
                action: action,
                dismissAfter: dismissAfter
            )
        )
    }
}

private extension UIColor {
    func imageWithColor(width: Int, height: Int) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

private struct SnackBarsPreviewView: View {
    @State var isPresenting = true

    @State var isPresenting2 = true

    @State var isPresenting3 = true

    @State var textOfLabel = "Hello"

    var body: some View {
        ZStack {
            Color.clear
            ZStack {
                Button {
                    isPresenting.toggle()
                    isPresenting3.toggle()
                } label: {
                    Text("Toggle SnackBar")
                }
            }
            .charcoalSnackBar(
                isPresenting: $isPresenting,
                screenEdge: .top,
                screenEdgeSpacing: 96,
                text: "ブックマークしました",
                thumbnailImage: Image(uiImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64)),
                action: {
                    Button {
                        print("Tapped")
                    } label: {
                        Text("編集")
                    }
                }
            )
            .charcoalSnackBar(
                isPresenting: $isPresenting2,
                screenEdgeSpacing: 192,
                text: "ブックマークしました",
                dismissAfter: 2,
                action: {
                    Button {
                        print("Tapped")
                    } label: {
                        Text("編集")
                    }
                }
            )
            .charcoalSnackBar(
                isPresenting: $isPresenting3,
                screenEdgeSpacing: 275,
                text: "ブックマークしました"
            )
        }
        .charcoalOverlayContainer()
    }
}

#Preview {
    SnackBarsPreviewView()
}
