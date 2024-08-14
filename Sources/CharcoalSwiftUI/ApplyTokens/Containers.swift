import SwiftUI

extension CharcoalApplyTokens {
    public enum Containers {
        case primary
    }
}

extension CharcoalApplyTokens.Containers {
    struct modifier: ViewModifier {
        let isPressed: Bool
        let backgroundColor: Color
        let backgroundPressedColor: Color
        
        func body(content: Content) -> some View {
            content
                .background(isPressed ? backgroundColor : backgroundPressedColor)
        }
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalContainer(applyToken: CharcoalApplyTokens.Containers, isPressed: Bool) -> some View {
        switch applyToken {
        case .primary:
            return modifier(CharcoalApplyTokens.Containers.modifier(isPressed: isPressed, 
                                                                    backgroundColor: Color(CharcoalFoundation.Colors.containerPrimaryPress.value),
                                                                    backgroundPressedColor: Color(CharcoalFoundation.Colors.containerPrimaryDefault.value)))
        }
    }
}
