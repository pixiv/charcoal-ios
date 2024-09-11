import SwiftUI

struct CharcoalIdentifiableOverlayView: View, Identifiable {
    typealias IDValue = UUID

    /// The unique ID of the overlay.
    let id: IDValue

    /// The content to display in the overlay.
    let contentView: AnyView

    var body: some View {
        contentView
    }
}
