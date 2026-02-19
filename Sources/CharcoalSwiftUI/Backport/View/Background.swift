import SwiftUI

extension Backport where Content: View {
    @ViewBuilder func background(_ color: Color, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View {
        content
            .background(color, ignoresSafeAreaEdges: edges)
    }
}
