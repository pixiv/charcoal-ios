import Charcoal
import SwiftUI

extension CharcoalAsset.Images {
    var description: String {
        return String(String(reflecting: self).split(separator: ".").last ?? "")
    }
}

struct IconsView: View {
    let icons = CharcoalAsset.Images.allCases
    let columns = 4

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                let rows = icons.count / columns + 1
                ForEach(0 ..< rows, id: \.self) { row in
                    HStack(spacing: 16) {
                        ForEach(0 ..< columns, id: \.self) { column in
                            let iconIndex = row * 4 + column
                            if iconIndex < icons.count {
                                let icon = icons[iconIndex]
                                VStack {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: 64, height: 64)
                                            .cornerRadius(8)
                                            .foregroundStyle(Color(charcoalColor: .background2))
                                        Image(charcoalIcon: icon)
                                    }
                                    Text(icon.description)
                                        .lineLimit(2)
                                        .charcoalTypography12Regular()
                                        .charcoalOnSurfaceText1()
                                }
                                .frame(width: 64, height: 110, alignment: .top)
                            } else {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .foregroundColor(Color.clear)
                            }
                        }
                    }
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Icons")
    }
}

#Preview {
    IconsView()
}
