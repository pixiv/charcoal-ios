import SwiftUI

struct CharcoalSnackBar<ActionContent: View>: CharcoalPopupView {
    /// The text of the snackbar
    let text: String

    /// The thumbnail image of the snackbar
    let thumbnailImage: Image?

    /// The maximum width of the snackbar
    let maxWidth: CGFloat

    /// The corner radius of the snackbar
    let cornerRadius: CGFloat = 32

    /// The spacing between the snackbar and the screen edge
    let bottomSpacing: CGFloat

    /// The content of the action view
    let action: ActionContent?

    @State private var tooltipSize: CGSize = .zero

    init(
        text: String,
        maxWidth: CGFloat = 312,
        bottomSpacing: CGFloat,
        thumbnailImage: Image?,
        @ViewBuilder action: () ->  ActionContent?
    ) {
        self.text = text
        self.maxWidth = maxWidth
        self.thumbnailImage = thumbnailImage
        self.action = action()
        self.bottomSpacing = bottomSpacing
    }

    var body: some View {
        ZStack(alignment: .bottom) {
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
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color(CharcoalAsset.ColorPaletteGenerated.border.color), lineWidth: 1))
            .offset(CGSize(width: 0, height: -bottomSpacing))

        }.frame(minWidth: 0, maxWidth: maxWidth, alignment: .center)
    }

    static func == (lhs: CharcoalSnackBar, rhs: CharcoalSnackBar) -> Bool {
        return lhs.text == rhs.text && lhs.maxWidth == rhs.maxWidth && lhs.thumbnailImage == rhs.thumbnailImage
    }
}

struct CharcoalSnackBarModifier<ActionContent: View>: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool

    /// The spacing between the snackbar and the screen edge
    let bottomSpacing: CGFloat

    /// Text to be displayed in the snackbar
    let text: String

    /// The thumbnail image to be displayed in the snackbar
    let thumbnailImage: Image?

    /// The action to be displayed in the snackbar
    @ViewBuilder let action: () ->  ActionContent?

    /// Assign a unique ID to the view
    @State var viewID = UUID()
    
    /// The overlay will be dismissed after a certain time interval.
    let dismissAfter: TimeInterval?

    func body(content: Content) -> some View {
        content
            .overlay(Color.clear
                .modifier(
                    CharcoalOverlayContainerChild(
                        isPresenting: $isPresenting,
                        dismissOnTouchOutside: false,
                        view: CharcoalSnackBar(
                            text: text,
                            bottomSpacing: bottomSpacing,
                            thumbnailImage: thumbnailImage,
                            action: action
                        ),
                        viewID: viewID,
                        dismissAfter: dismissAfter
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
        - action: The action to be displayed in the snackbar.

     # Example #
     ```swift
     Text("Hello").charcoalSnackBar(isPresenting: $isPresenting, text: "Hello")
     ```
     */
    func charcoalSnackBar<Content>(
        isPresenting: Binding<Bool>,
        bottomSpacing: CGFloat = 96,
        text: String,
        thumbnailImage: Image? = nil,
        dismissAfter: TimeInterval? = nil,
        @ViewBuilder action: @escaping () -> Content = { EmptyView() }
    ) -> some View where Content: View {
        return modifier(CharcoalSnackBarModifier(isPresenting: isPresenting, bottomSpacing: bottomSpacing, text: text, thumbnailImage: thumbnailImage, action: action, dismissAfter: dismissAfter))
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
                    isPresenting2.toggle()
                    isPresenting3.toggle()
                } label: {
                    Text("Toggle SnackBar")
                }
            }
            .charcoalSnackBar(
                isPresenting: $isPresenting,
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
                bottomSpacing: 192,
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
                bottomSpacing: 275,
                text: "ブックマークしました"
            )
        }
        .charcoalOverlayContainer()
    }
}

#Preview {
    SnackBarsPreviewView()
}
