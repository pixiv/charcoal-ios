public enum CharcoalToastAppearance {
    case success
    case error

    public var background: ColorAsset.Color {
        switch self {
        case .success:
            return CharcoalAsset.ColorPaletteGenerated.success.color
        case .error:
            return CharcoalAsset.ColorPaletteGenerated.assertive.color
        }
    }
}
