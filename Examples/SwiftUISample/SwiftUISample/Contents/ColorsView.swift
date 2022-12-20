import Charcoal
import SwiftUI

struct ColorsView: View {
    let colors = [
        CharcoalAsset.ColorPaletteGenerated.background1,
        CharcoalAsset.ColorPaletteGenerated.background2,
        CharcoalAsset.ColorPaletteGenerated.brand,
        CharcoalAsset.ColorPaletteGenerated.border,
        CharcoalAsset.ColorPaletteGenerated.link1,
        CharcoalAsset.ColorPaletteGenerated.link2,
        CharcoalAsset.ColorPaletteGenerated.text1,
        CharcoalAsset.ColorPaletteGenerated.text2,
        CharcoalAsset.ColorPaletteGenerated.text3,
        CharcoalAsset.ColorPaletteGenerated.text4,
        CharcoalAsset.ColorPaletteGenerated.text5,
        CharcoalAsset.ColorPaletteGenerated.icon6,
        CharcoalAsset.ColorPaletteGenerated.assertive,
        CharcoalAsset.ColorPaletteGenerated.callToAction0,
        CharcoalAsset.ColorPaletteGenerated.callToAction100,
        CharcoalAsset.ColorPaletteGenerated.success,
        CharcoalAsset.ColorPaletteGenerated.warning,
        CharcoalAsset.ColorPaletteGenerated.updatedItem,
        CharcoalAsset.ColorPaletteGenerated.surface1,
        CharcoalAsset.ColorPaletteGenerated.surface2,
        CharcoalAsset.ColorPaletteGenerated.surface3,
        CharcoalAsset.ColorPaletteGenerated.surface4,
        CharcoalAsset.ColorPaletteGenerated.surface50,
        CharcoalAsset.ColorPaletteGenerated.surface5100,
        CharcoalAsset.ColorPaletteGenerated.surface6,
        CharcoalAsset.ColorPaletteGenerated.surface7,
        CharcoalAsset.ColorPaletteGenerated.surface8,
        CharcoalAsset.ColorPaletteGenerated.surface9,
        CharcoalAsset.ColorPaletteGenerated.surface10
    ].map { Color($0.color) }
    let columns = 4

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0 ..< colors.count / columns + 1) { row in
                    HStack(spacing: 16) {
                        ForEach(0 ..< columns) { column in
                            if row * 4 + column < colors.count {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .foregroundColor(colors[row * 4 + column])
                                    .cornerRadius(8)
                            } else {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .foregroundColor(.clear)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Colors")
    }
}
