import SwiftUI

public extension Image {
    @inlinable init(charocalIcon: CharcoalAsset.Images) {
        self.init(asset: charocalIcon.imageAsset)
    }
}

#Preview {
    VStack {
        Image(charocalIcon: .add24)
        Image(charocalIcon: .delete32)
        Image(charocalIcon: .addInline)
        Image(charocalIcon: .codes24)
    }
}
