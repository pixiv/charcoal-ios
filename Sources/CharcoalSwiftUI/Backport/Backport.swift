import SwiftUI

struct Backport<Content> {
    let content: Content

    init(_ content: Content) {
        self.content = content
    }
}

extension View {
    var backport: Backport<Self> { Backport(self) }
}
