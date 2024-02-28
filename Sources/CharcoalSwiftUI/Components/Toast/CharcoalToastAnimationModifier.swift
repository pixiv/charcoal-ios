import SwiftUI

struct CharcoalToastAnimationModifier: ViewModifier, CharcoalToastBaseProtocol, CharcoalToastAnimationProtocol {
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

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: borderLineWidth))
            .overlay(
                GeometryReader(content: { geometry in
                    Color.clear.preference(key: PopupViewSizeKey.self, value: geometry.size)
                })
            )
            .offset(CGSize(width: 0, height: animationConfiguration.enablePositionAnimation ? (isActuallyPresenting ? screenEdge.offset*screenEdgeSpacing : -screenEdge.offset*(tooltipSize.height)) : screenEdge.offset*screenEdgeSpacing))
            .opacity(isActuallyPresenting ? 1 : 0)
            .onPreferenceChange(PopupViewSizeKey.self, perform: { value in
                tooltipSize = value
            })
            .onChange(of: isActuallyPresenting) { newValue in
                if let dismissAfter = dismissAfter, newValue {
                    DispatchQueue.main.asyncAfter(deadline: .now() + dismissAfter) {
                        isPresenting = false
                    }
                }
            }
            .animation(animationConfiguration.animation, value: isActuallyPresenting)
            .onChange(of: isPresenting, perform: { newValue in
                isActuallyPresenting = isPresenting
            })
            .onAppear {
                isActuallyPresenting = isPresenting
            }
    }
}


public extension View {
    func charcoalAnimatedToast(
        isPresenting: Binding<Bool>,
        isActuallyPresenting: Binding<Bool>,
        tooltipSize: Binding<CGSize>,
        cornerRadius: CGFloat,
        borderColor: Color,
        borderLineWidth: CGFloat,
        screenEdge: CharcoalPopupViewEdge,
        screenEdgeSpacing: CGFloat,
        dismissAfter: TimeInterval? = nil,
        animationConfiguration: CharcoalToastAnimationConfiguration = .default) -> some View {
            modifier(CharcoalToastAnimationModifier(text: "", maxWidth: 0, isPresenting: isPresenting, cornerRadius: cornerRadius, borderColor: borderColor, borderLineWidth: borderLineWidth , screenEdge: screenEdge, screenEdgeSpacing: screenEdgeSpacing, tooltipSize: tooltipSize, isActuallyPresenting: isActuallyPresenting, animationConfiguration: animationConfiguration, dismissAfter: dismissAfter))
    }
}
