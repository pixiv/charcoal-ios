import Foundation
import SwiftUI
import Combine

public class CharcoalContainerManager: ObservableObject {
    static let share = CharcoalContainerManager()
    
    @Published var overlayView: AnyView?
    
    @Published var isPresenting: Bool = false
    
    public func addView<SubContent: View>(view: SubContent) {
        self.overlayView = AnyView(view)
    }
    
    public func removeView() {
        self.overlayView = nil
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
