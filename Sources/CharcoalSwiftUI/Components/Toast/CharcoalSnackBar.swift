import SwiftUI

struct CharcoalSnackBar: CharcoalPopupView {
    /// The text of the tooltip
    let text: String

    /// The maximum width of the tooltip
    let maxWidth: CGFloat

    /// The corner radius of the tooltip
    let cornerRadius: CGFloat = 32

    /// The spacing between the tooltip and the screen edge
    let spacingToScreen: CGFloat = 16

    @State private var tooltipSize: CGSize = .zero

    var offset: CGSize {
        CGSize(width: 0, height: 0)
    }

    init(text: String, maxWidth: CGFloat = 312) {
        self.text = text
        self.maxWidth = maxWidth
    }

    var body: some View {
        ZStack(alignment: .center) {
            HStack(spacing: 0) {
                Image(charocalIcon: .addImage24)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                HStack(spacing: 16) {
                    Text(text)
                        .charcoalTypography14Bold(isSingleLine: true)
                        .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.text1.color))
                    Button {
                        
                    } label: {
                        Text("hello")
                    }.charcoalDefaultButton(size: .small)
                }
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            }
            .cornerRadius(cornerRadius, corners: .allCorners)
            .clipped()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(CharcoalAsset.ColorPaletteGenerated.border.color), lineWidth: 1)
            )

        }.frame(minWidth: 0, maxWidth: maxWidth, alignment: .leading)
    }

    static func == (lhs: CharcoalSnackBar, rhs: CharcoalSnackBar) -> Bool {
        return lhs.text == rhs.text && lhs.maxWidth == rhs.maxWidth && lhs.tooltipSize == rhs.tooltipSize
    }
}


struct CharcoalSnackBarModifier: ViewModifier {
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
                    .modifier(CharcoalOverlayContainerChild(isPresenting: $isPresenting, view: CharcoalSnackBar(text: text), viewID: viewID))
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
    func charcoalSnackBar(
        isPresenting: Binding<Bool>,
        text: String
    ) -> some View {
        return modifier(CharcoalSnackBarModifier(isPresenting: isPresenting, text: text))
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

                    VStack {
                        Text(textOfLabel)

                        Button {
                            textOfLabel = ["Changed", "Hello"].randomElement()!
                        } label: {
                            Text("Change Label")
                        }
                    }
                }
            }
            .charcoalSnackBar(isPresenting: $isPresenting6, text: "Hello World This is a tooltip and here is testing it's multiple line feature")
        })
        .charcoalOverlayContainer()
    }
}

#Preview {
    SnackBarsPreviewView()
}
