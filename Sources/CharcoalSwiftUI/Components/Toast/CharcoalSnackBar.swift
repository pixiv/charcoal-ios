import SwiftUI

struct CharcoalSnackBar<CharcoalSnackBarActionContent: View>: CharcoalPopupView {
    /// The text of the snackbar
    let text: String
    
    /// The thumbnail image of the snackbar
    let thumbnailImage: UIImage?
    
    /// The maximum width of the snackbar
    let maxWidth: CGFloat
    
    /// The corner radius of the snackbar
    let cornerRadius: CGFloat = 32
    
    /// The spacing between the snackbar and the screen edge
    let spacingToScreen: CGFloat = 16
    
    /// The content of the action view
    let action: CharcoalSnackBarActionContent?
    
    @State private var tooltipSize: CGSize = .zero
    
    init(text: String,
         maxWidth: CGFloat = 312,
         thumbnailImage: UIImage?,
         action: CharcoalSnackBarActionContent?) {
        self.text = text
        self.maxWidth = maxWidth
        self.thumbnailImage = thumbnailImage
        self.action = action
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack(spacing: 0) {
                if let thumbnailImage = thumbnailImage {
                    Image(uiImage: thumbnailImage)
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
            .cornerRadius(cornerRadius, corners: .allCorners)
            .clipped()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color(CharcoalAsset.ColorPaletteGenerated.border.color), lineWidth: 1)
            )
            
        }.frame(minWidth: 0, maxWidth: maxWidth, alignment: .center)
    }
    
    static func == (lhs: CharcoalSnackBar, rhs: CharcoalSnackBar) -> Bool {
        return lhs.text == rhs.text && lhs.maxWidth == rhs.maxWidth && lhs.tooltipSize == rhs.tooltipSize
    }
}


struct CharcoalSnackBarModifier<CharcoalSnackBarActionContent: View>: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool
    
    /// Text to be displayed in the snackbar
    let text: String
    
    /// The thumbnail image to be displayed in the snackbar
    let thumbnailImage: UIImage?
    
    /// The action to be displayed in the snackbar
    let action: CharcoalSnackBarActionContent?
    
    /// Assign a unique ID to the view
    @State var viewID = UUID()
    
    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader(content: { proxy in
                Color.clear
                    .modifier(
                        CharcoalOverlayContainerChild(
                            isPresenting: $isPresenting,
                            view: CharcoalSnackBar(
                                text: text,
                                thumbnailImage: thumbnailImage,
                                action: action
                            ),
                            viewID: viewID))
            }))
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
    func charcoalSnackBar(
        isPresenting: Binding<Bool>,
        text: String,
        thumbnailImage: UIImage? = nil,
        action: @escaping () -> some View = {EmptyView()}
    ) -> some View {
        return modifier(CharcoalSnackBarModifier(isPresenting: isPresenting, text: text, thumbnailImage: thumbnailImage, action: action()))
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
    @State var isPresenting6 = true
    
    @State var textOfLabel = "Hello"
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView {
                ZStack(alignment: .topLeading) {
                    Color.clear
                }
            }
            .charcoalSnackBar(
                isPresenting: $isPresenting6,
                text: "ブックマークしました",
                thumbnailImage: CharcoalAsset.ColorPaletteGenerated.border.color.imageWithColor(width: 64, height: 64),
                action: {
                    Button {
                        print("Tapped")
                    } label: {
                        Text("編集")
                    }}
            )
        })
        .charcoalOverlayContainer()
    }
}

#Preview {
    SnackBarsPreviewView()
}
