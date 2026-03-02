import Charcoal
import SwiftUI

struct ColorsV2View: View {
    var body: some View {
        List {
            NavigationLink(destination: ColorsV2ListView(kind: .applied).charcoalOverlayContainer()) {
                Text("Applied")
            }
            NavigationLink(destination: ColorsV2ListView(kind: .primitive).charcoalOverlayContainer()) {
                Text("Primitive")
            }
        }
        .navigationBarTitle("Colors 2.0")
    }
}

struct ColorsV2ListView: View {
    enum Kind {
        case applied
        case primitive

        var title: String {
            switch self {
            case .applied:
                return "Applied"
            case .primitive:
                return "Primitive"
            }
        }

        var assets: [ColorAsset] {
            let all = CharcoalAsset.ColorPaletteV2Generated.allColorAssets
            switch self {
            case .applied:
                return all.filter { asset in
                    !asset.name.hasPrefix("light/") && !asset.name.hasPrefix("dark/")
                }
            case .primitive:
                return all.filter { asset in
                    asset.name.hasPrefix("light/") || asset.name.hasPrefix("dark/")
                }
            }
        }

        var useTwoLevelPrefix: Bool {
            switch self {
            case .applied:
                return false
            case .primitive:
                return true
            }
        }
    }

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

    private struct ColorSection: Identifiable {
        let id: String
        let title: String
        let items: [ColorAsset]
    }

    let kind: Kind
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 32, maximum: 32), spacing: 8)]

    private var sections: [ColorSection] {
        let grouped = Dictionary(grouping: kind.assets) { asset in
            let components = asset.name.split(separator: "/").map(String.init)
            if kind.useTwoLevelPrefix, components.count >= 2 {
                return "\(components[0])/\(components[1])"
            }
            return components.first ?? asset.name
        }
        return grouped
            .map { key, value in
                ColorSection(id: key, title: key, items: value.sorted { $0.name < $1.name })
            }
            .sorted { $0.title < $1.title }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(sections) { section in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(section.title)
                            .charcoalTypography12Regular()
                            .charcoalOnSurfaceText1()
                        LazyVGrid(columns: columns, alignment: .leading, spacing: 8) {
                            ForEach(section.items, id: \.name) { asset in
                                ColorItemView(name: asset.name, color: asset.color)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
        }
        .navigationBarTitle(kind.title)
    }
}

#Preview {
    ColorsV2View()
}
