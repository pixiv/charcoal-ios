import SwiftUI

extension CharcoalApplyTokens {
    public enum Texts {
        case `default`
        case disable
        case onPrimary
        case onHUD
        case onSecondary
        case onOnImg
        
        func color(state: CharcoalApplyTokens.Texts.States) -> Color {
            switch self {
            case .onPrimary:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.textOnPrimaryPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.textOnPrimaryDefault.value)
                }
            case .onSecondary:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.textSecondaryPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.textSecondaryDefault.value)
                }
            case .onHUD:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.textOnHudPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.textOnHudDefault.value)
                }
            case .onOnImg:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.textOnOnImgPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.textOnOnImgDefault.value)
                }
            case .disable:
                return Color(CharcoalFoundation.Colors.textDisable.value)
            default:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.textPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.textDefault.value)
                }
            }
        }
    }
}

extension CharcoalApplyTokens.Texts {
    public enum States {
        case `default`
        case hover
        case press
    }
}

extension CharcoalApplyTokens.Texts {
    struct apply: ViewModifier {
        let color: Color
        
        func body(content: Content) -> some View {
            content
                .foregroundColor(color)
        }
    }
}

public extension View {
    func charcoalText(applyToken: CharcoalApplyTokens.Texts, state: CharcoalApplyTokens.Texts.States) -> some View {
        modifier(CharcoalApplyTokens.Texts.apply(color: applyToken.color(state: state)))
    }
}
