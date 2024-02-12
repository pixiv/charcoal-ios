import Combine
import Foundation
import SwiftUI

class CharcoalContainerManager: ObservableObject {
    @Published var overlayViews: [CharcoalIdentifiableOverlayView] = []

    func addView(view: CharcoalIdentifiableOverlayView) {
        if let index = overlayViews.firstIndex(where: { $0.id == view.id }) {
            // Make sure we don't have duplicate views and the latest view's zIndex is on top of the Stack
            overlayViews.remove(at: index)
        }
        overlayViews.append(view)
    }

    func removeView(id: CharcoalIdentifiableOverlayView.IDValue) {
        overlayViews.removeAll(where: { $0.id == id })
    }

    func clear() {
        overlayViews.removeAll()
    }
}
