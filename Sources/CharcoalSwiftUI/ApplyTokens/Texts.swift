import SwiftUI

extension CharcoalApplyTokens {
    public enum Texts {
        case onPrimary
    }
}

extension CharcoalApplyTokens.Texts {
    struct apply: ViewModifier {
        let isPressed: Bool
        let foregroundColor: Color
        let foregroundPressedColor: Color
        
        func body(content: Content) -> some View {
            content
                .foregroundColor(isPressed ? foregroundColor : foregroundPressedColor)
        }
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalApplyToken(text: CharcoalApplyTokens.Texts, isPressed: Bool) -> some View {
        switch text {
        case .onPrimary:
            return modifier(CharcoalApplyTokens.Texts.apply(isPressed: isPressed,
                                                               foregroundColor: Color(CharcoalFoundation.Colors.textOnPrimaryDefault.value),
                                                               foregroundPressedColor: Color(CharcoalFoundation.Colors.textOnPrimaryPress.value)))
        }
    }
}
