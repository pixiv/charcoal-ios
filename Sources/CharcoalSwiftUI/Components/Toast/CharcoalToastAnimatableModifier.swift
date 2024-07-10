import Combine
import SwiftUI

struct CharcoalToastAnimatableModifier: ViewModifier, CharcoalToastBase {
    var text: String

    var maxWidth: CGFloat

    @Binding var isPresenting: Bool

    let cornerRadius: CGFloat

    let borderColor: Color

    let borderLineWidth: CGFloat

    let screenEdge: CharcoalPopupViewEdge

    let screenEdgeSpacing: CGFloat

    @Binding var tooltipSize: CGSize

    @Binding var isActuallyPresenting: Bool

    let animationConfiguration: CharcoalToastAnimationConfiguration

    let dismissAfter: TimeInterval?

    @Binding var isDragging: Bool

    @State var timer: Timer?

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: borderLineWidth))
            .overlay(
                GeometryReader(content: { proxy in
                    Color.clear.preference(key: PopupViewSizeKey.self, value: proxy.size)
                })
            )
            .offset(CGSize(width: 0, height: animationConfiguration.enablePositionAnimation ? (isActuallyPresenting ? screenEdge.direction * screenEdgeSpacing : -screenEdge.direction * (tooltipSize.height)) : screenEdge.direction * screenEdgeSpacing))
            .opacity(isActuallyPresenting ? 1 : 0)
            .onPreferenceChange(PopupViewSizeKey.self, perform: { value in
                tooltipSize = value
            })
            .onChange(of: isActuallyPresenting) { newValue in
                if let dismissAfter = dismissAfter, newValue {
                    timer = Timer.scheduledTimer(withTimeInterval: dismissAfter, repeats: false, block: { _ in
                        if !isDragging {
                            isPresenting = false
                        }
                    })
                }
            }
            .onChange(of: isDragging, perform: { _ in
                if isDragging {
                    timer?.invalidate()
                }
            })
            .animation(animationConfiguration.animation, value: isActuallyPresenting)
            .onChange(of: isPresenting, perform: { newValue in
                isActuallyPresenting = newValue
            })
            .onAppear {
                isActuallyPresenting = isPresenting
            }
    }
}

extension View {
    func charcoalAnimatableToast(
        isPresenting: Binding<Bool>,
        isActuallyPresenting: Binding<Bool>,
        isDragging: Binding<Bool> = Binding.constant(false),
        tooltipSize: Binding<CGSize>,
        cornerRadius: CGFloat,
        borderColor: Color,
        borderLineWidth: CGFloat,
        screenEdge: CharcoalPopupViewEdge,
        screenEdgeSpacing: CGFloat,
        dismissAfter: TimeInterval? = nil,
        animationConfiguration: CharcoalToastAnimationConfiguration
    ) -> some View {
        modifier(CharcoalToastAnimatableModifier(text: "", maxWidth: 0, isPresenting: isPresenting, cornerRadius: cornerRadius, borderColor: borderColor, borderLineWidth: borderLineWidth, screenEdge: screenEdge, screenEdgeSpacing: screenEdgeSpacing, tooltipSize: tooltipSize, isActuallyPresenting: isActuallyPresenting, animationConfiguration: animationConfiguration, dismissAfter: dismissAfter, isDragging: isDragging))
    }
}
