import Charcoal
import SwiftUI

extension CharcoalAsset.ColorPaletteGenerated {
    var description: String {
        return String(String(reflecting: self).split(separator: ".").last ?? "")
    }
}

struct ColorsView: View {
    private struct ColorItemView: View {
        let name: String
        let color: UIColor
        @State private var isPresenting = false

        var body: some View {
            RoundedRectangle(cornerRadius: 6)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(color))
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black.opacity(0.08), lineWidth: 1)
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    isPresenting = true
                }
                .charcoalTooltip(isPresenting: $isPresenting, text: name)
        }
    }

    let colors = CharcoalAsset.ColorPaletteGenerated.allCases
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 32, maximum: 32), spacing: 8)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                ForEach(colors, id: \.self) { color in
                    ColorItemView(name: color.description, color: color.color)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
        }
        .navigationBarTitle("Colors")
        .charcoalOverlayContainer()
    }
}
