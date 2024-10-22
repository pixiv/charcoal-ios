import SwiftUI

public extension Image {
    @inlinable init(charcoalIcon: CharcoalAsset.Images) {
        self.init(asset: charcoalIcon.imageAsset)
    }
}

#Preview {
    VStack {
        Image(charcoalIcon: .add24)
        Image(charcoalIcon: .delete32)
        Image(charcoalIcon: .addInline)
        Image(charcoalIcon: .codes24)
    }
}
