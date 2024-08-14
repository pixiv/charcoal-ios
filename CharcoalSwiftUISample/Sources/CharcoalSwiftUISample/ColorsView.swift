import Charcoal
import SwiftUI

struct ColorsView: View {
    let colors = CharcoalFoundation.Colors.allCases
    let columns = 4

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0 ..< colors.count / columns + 1, id: \.self) { row in
                    HStack(spacing: 16) {
                        ForEach(0 ..< columns, id: \.self) { column in
                            if row * 4 + column < colors.count {
                                VStack {
                                    Rectangle()
                                        .frame(width: 64, height: 64)
                                        .foregroundColor(Color(colors[row * 4 + column].value))
                                        .cornerRadius(8)
                                    Text(String(describing: colors[row * 4 + column])).font(.caption).frame(width: 64, height: 40)
                                }
                            } else {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .foregroundColor(Color.clear)
                            }
                        }
                    }
                }
            }.padding()
        }
        .navigationBarTitle("Colors")
    }
}
