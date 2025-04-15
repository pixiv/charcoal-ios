import SwiftUI

public extension Text {
    enum CharcoalTypography {
        case regular10
        case bold10
        case regular12
        case bold12
        case regular14
        case bold14
        case regular16
        case bold16
        case regular20
        case bold20

        typealias Value = (size: CGFloat, weight: UIFont.Weight)

        var value: Value {
            switch self {
            case .regular10:
                return (size: 10, weight: .regular)
            case .bold10:
                return (size: 10, weight: .bold)
            case .regular12:
                return (size: CGFloat(charcoalFoundation.typography.size.the12.fontSize), weight: .regular)
            case .bold12:
                return (size: CGFloat(charcoalFoundation.typography.size.the12.fontSize), weight: .bold)
            case .regular14:
                return (size: CGFloat(charcoalFoundation.typography.size.the14.fontSize), weight: .regular)
            case .bold14:
                return (size: CGFloat(charcoalFoundation.typography.size.the14.fontSize), weight: .bold)
            case .regular16:
                return (size: CGFloat(charcoalFoundation.typography.size.the16.fontSize), weight: .regular)
            case .bold16:
                return (size: CGFloat(charcoalFoundation.typography.size.the16.fontSize), weight: .bold)
            case .regular20:
                return (size: CGFloat(charcoalFoundation.typography.size.the20.fontSize), weight: .regular)
            case .bold20:
                return (size: CGFloat(charcoalFoundation.typography.size.the20.fontSize), weight: .bold)
            }
        }
    }

    func font(charcoalTypography: CharcoalTypography) -> Text {
        self
            .font(
                .custom(UIFont.monospacedSystemFont(ofSize: .zero, weight: charcoalTypography.value.weight).fontName,
                          size: charcoalTypography.value.size,
                          relativeTo: .body)
            )
    }
}
