import SwiftUI

extension EnvironmentObject {
    var hasValue: Bool {
        !String(describing: self).contains("_store: nil")
    }
}
