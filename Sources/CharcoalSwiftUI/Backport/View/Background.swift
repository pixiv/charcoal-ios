import SwiftUI

extension Backport where Content: View {
    @ViewBuilder func background(_ color: Color, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View {
        if #available(iOS 15, *) {
            content
                .background(color, ignoresSafeAreaEdges: edges)
        } else {
            content
                .background(color)
                .ignoresSafeArea(.all, edges: edges)
        }
    }
}
