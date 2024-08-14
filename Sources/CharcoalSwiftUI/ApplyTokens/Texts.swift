import SwiftUI

extension CharcoalApplyTokens {
    public enum Texts {
        case onPrimary
    }
}

extension CharcoalApplyTokens.Texts {
    struct modifier: ViewModifier {
        let isPressed: Bool
        func body(content: Content) -> some View {
            content
                .foregroundColor(isPressed ? Color(CharcoalFoundation.Colors.textOnPrimaryPress.value) : Color(CharcoalFoundation.Colors.textOnPrimaryDefault.value))
        }
    }
}

public extension View {
    @warn_unqualified_access
    func charcoalText(applyToken: CharcoalApplyTokens.Texts, isPressed: Bool) -> some View {
        switch applyToken {
        case .onPrimary:
            return modifier(CharcoalApplyTokens.Texts.modifier(isPressed: isPressed))
        }
    }
}
