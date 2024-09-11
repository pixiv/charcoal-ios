import SwiftUI

extension CharcoalApplyTokens {
    public enum Containers {
        case `default`
        case disable
        case primary
        case hud
        case secondary
        case onImg
        
        func color(state: CharcoalApplyTokens.Containers.States) -> Color {
            switch self {
            case .primary:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.containerPrimaryPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.containerPrimaryDefault.value)
                }
            case .secondary:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.containerSecondaryPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.containerSecondaryDefault.value)
                }
            case .hud:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.containerHudPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.containerHudDefault.value)
                }
            case .onImg:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.containerOnImgPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.containerOnImgDefault.value)
                }
            case .disable:
                return Color(CharcoalFoundation.Colors.containerDisable.value)
            default:
                switch state {
                case .press:
                    return Color(CharcoalFoundation.Colors.containerPress.value)
                default:
                    return Color(CharcoalFoundation.Colors.containerDefault.value)
                }
            }
        }
    }
}

extension CharcoalApplyTokens.Containers {
    public enum States {
        case `default`
        case hover
        case press
        case defaultA
        case hoverA
        case pressA
    }
}

extension CharcoalApplyTokens.Containers {
    struct apply: ViewModifier {
        let color: Color
        
        func body(content: Content) -> some View {
            content.background(color)
        }
    }
}

public extension View {
    func charcoalContainer(applyToken: CharcoalApplyTokens.Containers, state: CharcoalApplyTokens.Containers.States) -> some View {
        modifier(CharcoalApplyTokens.Containers.apply(color: applyToken.color(state: state)))
    }
}
