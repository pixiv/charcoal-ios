import SwiftUI

extension CharcoalApplyTokens {
    public enum Containers {
        case primary
        
        func color(state: CharcoalApplyTokens.Containers.States) -> Color {
            switch state {
            case .press:
                return Color(CharcoalFoundation.Colors.containerPress.value)
            default:
                return Color(CharcoalFoundation.Colors.containerDefault.value)
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
    @warn_unqualified_access
    func charcoalApplyToken(container: CharcoalApplyTokens.Containers, state: CharcoalApplyTokens.Containers.States) -> some View {
        modifier(CharcoalApplyTokens.Containers.apply(color: container.color(state: state)))
    }
}
