import SwiftUI

struct CharcoalToast<ActionContent: View>: CharcoalPopupProtocol, CharcoalToastBase, CharcoalToastActionable {
    typealias IDValue = UUID

    let id: IDValue

    let text: String

    let maxWidth: CGFloat

    /// The corner radius of the Toast
    let cornerRadius: CGFloat = 32

    let borderColor: Color

    let borderLineWidth: CGFloat = 2

    let screenEdge: CharcoalPopupViewEdge

    let screenEdgeSpacing: CGFloat

    /// The content of the action view
    let action: ActionContent?

    @State private var tooltipSize: CGSize = .zero

    /// A binding to whether the overlay is presented.
    @Binding var isPresenting: Bool

    let dismissAfter: TimeInterval?

    /// The appearance of the Toast
    let appearance: CharcoalToastAppearance

    @State var isActuallyPresenting: Bool = false

    let animationConfiguration: CharcoalToastAnimationConfiguration

    init(
        id: IDValue,
        text: String,
        maxWidth: CGFloat = 312,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat,
        @ViewBuilder action: () -> ActionContent?,
        isPresenting: Binding<Bool>,
        dismissAfter: TimeInterval?,
        appearance: CharcoalToastAppearance = .success,
        animationConfiguration: CharcoalToastAnimationConfiguration
    ) {
        self.id = id
        self.text = text
        self.maxWidth = maxWidth
        self.action = action()
        self.screenEdgeSpacing = screenEdgeSpacing
        _isPresenting = isPresenting
        self.dismissAfter = dismissAfter
        self.appearance = appearance
        self.screenEdge = screenEdge
        self.animationConfiguration = animationConfiguration
        borderColor = Color(CharcoalAsset.ColorPaletteGenerated.background1.color)
    }

    var body: some View {
        ZStack(alignment: screenEdge.alignment) {
            Color.clear
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
            .charcoalAnimatableToast(
                isPresenting: $isPresenting,
                isActuallyPresenting: $isActuallyPresenting,
                tooltipSize: $tooltipSize,
                cornerRadius: cornerRadius,
                borderColor: borderColor,
                borderLineWidth: borderLineWidth,
                screenEdge: screenEdge,
                screenEdgeSpacing: screenEdgeSpacing,
                dismissAfter: dismissAfter,
                animationConfiguration: animationConfiguration
            )
        }
        .frame(minWidth: 0, maxWidth: maxWidth, alignment: .center)
    }

    static func == (lhs: CharcoalToast, rhs: CharcoalToast) -> Bool {
        return lhs.text == rhs.text && lhs.maxWidth == rhs.maxWidth && lhs.isPresenting == rhs.isPresenting
    }
}

struct PopupViewSizeKey: PreferenceKey {
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }

    static var defaultValue: CGSize = .zero
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

public struct CharcoalToastAnimationConfiguration {
    public let enablePositionAnimation: Bool
    public let animation: Animation

    public init(enablePositionAnimation: Bool, animation: Animation) {
        self.enablePositionAnimation = enablePositionAnimation
        self.animation = animation
    }

    public static let `default` = CharcoalToastAnimationConfiguration(enablePositionAnimation: true, animation: .spring())
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

    let animationConfiguration: CharcoalToastAnimationConfiguration

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
                            dismissAfter: dismissAfter,
                            appearance: appearance,
                            animationConfiguration: animationConfiguration
                        ),
                        viewID: viewID
                    )))
    }
}

public extension View {
    /**
     Add a Toast to the view

     - Parameters:
        - isPresenting: A binding to whether the Toast  is presented.
        - dismissAfter: The overlay will be dismissed after a certain time interval.
        - screenEdge: The edge of the screen where the snackbar will be presented
        - screenEdgeSpacing: The spacing between the snackbar and the screen edge
        - text: The text to be displayed in the snackbar.
        - action: The action to be displayed in the snackbar.
        - appearance: The appearance of the Toast

     # Example #
     ```swift
     Text("Hello").charcoalToast(isPresenting: $isPresenting, text: "Hello")
     ```
     */
    func charcoalToast<Content>(
        isPresenting: Binding<Bool>,
        screenEdge: CharcoalPopupViewEdge = .bottom,
        screenEdgeSpacing: CGFloat = 96,
        text: String,
        dismissAfter: TimeInterval? = 2,
        appearance: CharcoalToastAppearance = .success,
        animationConfiguration: CharcoalToastAnimationConfiguration = .default,
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
                appearance: appearance, animationConfiguration: animationConfiguration
            )
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
                dismissAfter: 2,
                appearance: .error,
                action: {
                    Button {
                        isPresenting2 = false
                    } label: {
                        Image(charocalIcon: .remove16)
                            .renderingMode(.template)
                    }
                }
            )
            .charcoalToast(
                isPresenting: $isPresenting3,
                screenEdgeSpacing: 275,
                text: "テキストメッセージ",
                animationConfiguration: .init(enablePositionAnimation: false, animation: .easeInOut(duration: 0.2))
            )
        }
        .charcoalOverlayContainer()
    }
}

#Preview {
    ToastsPreviewView()
}
