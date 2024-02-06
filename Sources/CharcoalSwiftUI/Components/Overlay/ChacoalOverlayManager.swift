import Foundation
import SwiftUI
import Combine

@MainActor class CharcoalContainerManager: ObservableObject {
    static let share = CharcoalContainerManager()
    
    @Published var overlayViews: [CharcoalIdentifiableOverlayView] = []
    
    func addView(view: CharcoalIdentifiableOverlayView) {
        if let index = self.overlayViews.firstIndex(where: { $0.id == view.id }) {
            self.overlayViews.remove(at: index) // Make sure we don't have duplicate views and the latest view is on top of the Stack
        }
        self.overlayViews.append(view)
    }

    func removeView(id: CharcoalIdentifiableOverlayView.IDValue) {
        self.overlayViews.removeAll(where: { $0.id == id })
    }
    
    func clear() {
        self.overlayViews.removeAll()
    }
}
