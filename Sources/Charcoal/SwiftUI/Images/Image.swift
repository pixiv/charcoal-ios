import SwiftUI

extension Image {
    @inlinable init(charocalIcon: CharcoalAsset.Images) {
        self.init(asset: charocalIcon.imageAsset)
    }
}

// MARK: Development View

fileprivate struct ImageView: View {
    var body: some View {
        VStack {
            Image(charocalIcon: .add24)
            Image(charocalIcon: .delete32)
            Image(charocalIcon: .addInline)
            Image(charocalIcon: .codes24)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
