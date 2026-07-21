public extension CharcoalAsset.ColorPaletteV2Generated {
    enum Applied {
        public typealias Background = CharcoalAsset.ColorPaletteV2Generated.Background
        public typealias Border = CharcoalAsset.ColorPaletteV2Generated.Border
        public typealias Container = CharcoalAsset.ColorPaletteV2Generated.Container
        public typealias Icon = CharcoalAsset.ColorPaletteV2Generated.Icon
        public typealias Text = CharcoalAsset.ColorPaletteV2Generated.Text
    }

    enum Primitive {
        public typealias Dark = CharcoalAsset.ColorPaletteV2Generated.Dark
        public typealias Light = CharcoalAsset.ColorPaletteV2Generated.Light
    }

    private static var allAppliedColorAssets: [ColorAsset] {
        return allColorAssets.filter { asset in
            !asset.name.hasPrefix("light/") && !asset.name.hasPrefix("dark/")
        }
    }

    private static var allPrimitiveColorAssets: [ColorAsset] {
        return allColorAssets.filter { asset in
            asset.name.hasPrefix("light/") || asset.name.hasPrefix("dark/")
        }
    }
}
