import Foundation
import SwiftUI
import Combine

class CharcoalContainerManager: ObservableObject {
    
    @Published var overlayViews: [CharcoalIdentifiableOverlayView] = []
    
    func addView(view: CharcoalIdentifiableOverlayView) {
        if let index = self.overlayViews.firstIndex(where: { $0.id == view.id }) {
            // Make sure we don't have duplicate views and the latest view's zIndex is on top of the Stack
            self.overlayViews.remove(at: index)
        }
        self.overlayViews.append(view)
    }

    func removeView(id: CharcoalIdentifiableOverlayView.IDValue) {
        self.overlayViews.removeAll(where: { $0.id == id })
    }
    
    func clear() {
        self.overlayViews.removeAll()
    }
    
    deinit {
        clear()
    }
}
