import SwiftUI

extension CharcoalApplyTokens {
    public enum Backgrounds {
        case `default`
        case secondary
        case tertiary
        
        func color() -> Color {
            switch self {
            case .tertiary:
                return Color(CharcoalFoundation.Colors.backgroundTertiary.value)
            case .secondary:
                return Color(CharcoalFoundation.Colors.backgroundSecondary.value)
            default:
                return Color(CharcoalFoundation.Colors.backgroundDefault.value)
            }
        }
    }
}

extension CharcoalApplyTokens.Backgrounds{
    struct apply: ViewModifier {
        let color: Color
        let edges: Edge.Set
        
        func body(content: Content) -> some View {
            content.backport.background(color, ignoresSafeAreaEdges: edges)
        }
    }
}

public extension View {
    func charcoalBackground(applyToken: CharcoalApplyTokens.Backgrounds, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View {
        modifier(CharcoalApplyTokens.Backgrounds.apply(color: applyToken.color(), edges: edges))
    }
}
