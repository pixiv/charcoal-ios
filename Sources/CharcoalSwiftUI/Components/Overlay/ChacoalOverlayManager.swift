import Foundation
import SwiftUI
import Combine

@globalActor actor CharcoalContainerActor {
    static let shared = CharcoalContainerActor()
}

public class CharcoalContainerManager: ObservableObject {
    static let share = CharcoalContainerManager()
    
    @Published var overlayViews: [CharcoalIdentifiableOverlayView] = []
    
    @CharcoalContainerActor func addView(view: CharcoalIdentifiableOverlayView) {
        if let index = self.overlayViews.firstIndex(where: { $0.id == view.id }) {
            self.overlayViews.remove(at: index) // Make sure we don't have duplicate views and the latest view is on top of the Stack
        }
        self.overlayViews.append(view)
    }

    @CharcoalContainerActor func removeView(id: CharcoalIdentifiableOverlayView.IDValue) {
        self.overlayViews.removeAll(where: { $0.id == id })
    }
    
    @CharcoalContainerActor func clear() {
        self.overlayViews.removeAll()
    }
}

struct CharcoalContainerManagerKey: EnvironmentKey {
    static var defaultValue = CharcoalContainerManager.share
}

public extension EnvironmentValues {
    var overlayContainerManager: CharcoalContainerManager {
        get { self[CharcoalContainerManagerKey.self] }
        set { self[CharcoalContainerManagerKey.self] = newValue }
    }
}
