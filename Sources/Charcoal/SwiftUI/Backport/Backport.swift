import SwiftUI

@available(iOS 13, *)
struct Backport<Content> {
    let content: Content

    init(_ content: Content) {
        self.content = content
    }
}

@available(iOS 13, *)
extension View {
    var backport: Backport<Self> { Backport(self) }
}
