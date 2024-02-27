import SwiftUI

struct CharcoalToast<ActionContent: View>: CharcoalPopupView {
    typealias IDValue = UUID

    /// The unique ID of the overlay.
    let id: IDValue
    /// The text of the Toast
    let text: String
    
    /// The maximum width of the Toast
    let maxWidth: CGFloat

    /// The corner radius of the Toast
    let cornerRadius: CGFloat = 32
    
    let screenEdge: CharcoalPopupViewEdge

    /// The spacing between the snackbar and the screen edge
    let screenEdgeSpacing: CGFloat

    /// The content of the action view
    let action: ActionContent?

    @State private var tooltipSize: CGSize = .zero

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool

    /// If true, the overlay will be dismissed when the user taps outside of the overlay.
    let dismissOnTouchOutside: Bool

    /// The overlay will be dismissed after a certain time interval.
    let dismissAfter: TimeInterval?
    
    /// The appearance of the Toast
    let appearance: CharcoalToastAppearance

    init(
        id: IDValue,
        text: String,
        maxWidth: CGFloat = 312,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat,
        @ViewBuilder action: () -> ActionContent?,
        isPresenting: Binding<Bool>,
        dismissOnTouchOutside: Bool = true,
        dismissAfter: TimeInterval? = nil,
        appearance: CharcoalToastAppearance = .success
    ) {
        self.id = id
        self.text = text
        self.maxWidth = maxWidth
        self.action = action()
        self.screenEdgeSpacing = screenEdgeSpacing
        _isPresenting = isPresenting
        self.dismissOnTouchOutside = dismissOnTouchOutside
        self.dismissAfter = dismissAfter
        self.appearance = appearance
        self.screenEdge = screenEdge
    }

    var body: some View {
        ZStack(alignment: screenEdge.alignment) {
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
                HStack(spacing: 0) {
                    HStack(spacing: 8) {
                        Text(text)
                            .charcoalTypography14Bold(isSingleLine: true)
                            .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.background1.color))

                        if let action = action {
                            action
                                .foregroundColor(Color(CharcoalAsset.ColorPaletteGenerated.background1.color))
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                }
                .background(
                    appearance.background
                )
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color(CharcoalAsset.ColorPaletteGenerated.background1.color), lineWidth: 2))
                .offset(CGSize(width: 0, height: screenEdge.offset*screenEdgeSpacing))
                .onAppear {
                    if let dismissAfter = dismissAfter {
                        DispatchQueue.main.asyncAfter(deadline: .now() + dismissAfter) {
                            isPresenting = false
                        }
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isPresenting)
        .frame(minWidth: 0, maxWidth: maxWidth, alignment: .center)
    }

    static func == (lhs: CharcoalToast, rhs: CharcoalToast) -> Bool {
        return lhs.text == rhs.text && lhs.maxWidth == rhs.maxWidth  && lhs.isPresenting == rhs.isPresenting
    }
}

public enum CharcoalPopupViewEdge {
    case top
    case bottom
    
    var alignment: Alignment {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        }
    }
    
    var offset: CGFloat {
        switch self {
        case .top:
            return 1
        case .bottom:
            return -1
        }
    }
}


public enum CharcoalToastAppearance {
    case success
    case error
    
    var background: Color {
        switch self {
        case .success:
            return Color(CharcoalAsset.ColorPaletteGenerated.success.color)
        case .error:
            return Color(CharcoalAsset.ColorPaletteGenerated.assertive.color)
        }
    }
}

struct CharcoalToastModifier<ActionContent: View>: ViewModifier {
    /// Presentation `Binding<Bool>`
    @Binding var isPresenting: Bool

    let screenEdge: CharcoalPopupViewEdge
    /// The spacing between the snackbar and the screen edge
    let screenEdgeSpacing: CGFloat

    /// Text to be displayed in the snackbar
    let text: String

    /// The action to be displayed in the snackbar
    @ViewBuilder let action: () -> ActionContent?

    /// Assign a unique ID to the view
    @State var viewID = UUID()

    /// The overlay will be dismissed after a certain time interval.
    let dismissAfter: TimeInterval?
    
    /// The appearance of the Toast
    let appearance: CharcoalToastAppearance

    func body(content: Content) -> some View {
        content
            .overlay(Color.clear
                .modifier(
                    CharcoalOverlayUpdaterContainer(
                        isPresenting: $isPresenting,

                        view: CharcoalToast(
                            id: viewID,
                            text: text,
                            screenEdge: screenEdge,
                            screenEdgeSpacing: screenEdgeSpacing,
                            action: action,
                            isPresenting: $isPresenting,
                            dismissOnTouchOutside: false,
                            dismissAfter: dismissAfter,
                            appearance: appearance
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
        - action: The action to be displayed in the snackbar.

     # Example #
     ```swift
     Text("Hello").charcoalSnackBar(isPresenting: $isPresenting, text: "Hello")
     ```
     */
    func charcoalToast<Content>(
        isPresenting: Binding<Bool>,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat = 96,
        text: String,
        dismissAfter: TimeInterval? = nil,
        appearance: CharcoalToastAppearance = .success,
        @ViewBuilder action: @escaping () -> Content = { EmptyView() }
    ) -> some View where Content: View {
        return modifier(
            CharcoalToastModifier(
                isPresenting: isPresenting,
                screenEdge: screenEdge,
                screenEdgeSpacing: screenEdgeSpacing,
                text: text,
                action: action,
                dismissAfter: dismissAfter,
                appearance: appearance)
        )
    }
}

private struct ToastsPreviewView: View {
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
            .charcoalToast(
                isPresenting: $isPresenting,
                screenEdge: .top,
                text: "テキストメッセージ",
                action: {
                    Button {
                        isPresenting = false
                    } label: {
                        Image(charocalIcon: .remove16)
                            .renderingMode(.template)
                    }
                }
            )
            .charcoalToast(
                isPresenting: $isPresenting2,
                screenEdgeSpacing: 192,
                text: "テキストメッセージ",
                appearance: .error
            )
            .charcoalToast(
                isPresenting: $isPresenting3,
                screenEdgeSpacing: 275,
                text: "テキストメッセージ"
            )
        }
        .charcoalOverlayContainer()
    }
}

#Preview {
    ToastsPreviewView()
}
