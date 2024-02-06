import Foundation
import SwiftUI
import Combine

struct CharcoalIdentifiableOverlayView: View {
    typealias IDValue = UUID
    let id: IDValue
    var contentView: AnyView
    @Binding var isPresenting: Bool
    
    var body: some View {
        VStack {
            if isPresenting {
                contentView
            }
        }.animation(.easeInOut(duration: 0.2), value: isPresenting)
    }
}

public class CharcoalContainerManager: ObservableObject {
    static let share = CharcoalContainerManager()
    
    @Published var overlayViews: [CharcoalIdentifiableOverlayView] = []
    
    func addView(view: CharcoalIdentifiableOverlayView) {
        if let index = self.overlayViews.firstIndex(where: { $0.id == view.id }) {
            self.overlayViews[index] = view
        } else {
            self.overlayViews.append(view)
        }
    }
    
    func getView(id: CharcoalIdentifiableOverlayView.IDValue) -> CharcoalIdentifiableOverlayView? {
        return self.overlayViews.first(where: { $0.id == id })
    }
    
    func removeView(id: CharcoalIdentifiableOverlayView.IDValue) {
        self.overlayViews.removeAll(where: { $0.id == id })
    }
    
    func clear() {
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
