public enum CharcoalToastAppearance {
    case success
    case error

    public var background: CharcoalFoundation.Colors {
        switch self {
        case .success:
            return CharcoalFoundation.Colors.containerPositiveDefault
        case .error:
            return CharcoalFoundation.Colors.containerNegativeDefault
        }
    }
}
