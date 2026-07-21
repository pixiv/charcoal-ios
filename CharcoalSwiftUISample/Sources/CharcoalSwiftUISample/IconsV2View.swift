import Charcoal
import SwiftUI

extension CharcoalAsset.ImagesV2 {
    var description: String {
        return String(String(reflecting: self).split(separator: ".").last ?? "")
    }
}

struct IconsV2View: View {
    private struct IconItemView: View {
        let name: String
        let icon: CharcoalAsset.ImagesV2
        @State private var isPresenting = false

        private var pointSize: CGFloat {
            if name.hasSuffix("24") {
                return 24
            }
            if name.hasSuffix("20") {
                return 20
            }
            return 16
        }

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(charcoalColor: .background2)
                Image(charcoalIconV2: icon)
                    .frame(width: pointSize, height: pointSize)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isPresenting = true
            }
            .charcoalTooltip(isPresenting: $isPresenting, text: name)
        }
    }

    let icons = CharcoalAsset.ImagesV2.allCases
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 32, maximum: 32), spacing: 8)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                ForEach(icons, id: \.self) { icon in
                    IconItemView(name: icon.description, icon: icon)
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
        }
        .navigationBarTitle("Icons 2.0")
        .charcoalOverlayContainer()
    }
}

#Preview {
    IconsV2View()
}
