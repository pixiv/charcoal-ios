import SwiftUI

public extension Shape where Self == RoundedRectangle {
    // Using rect(cornerRadius:) because the standard Capsule doesn't work correctly on iOS 15 and below.
    static var charcoalCapsule: Self {
        return .rect(cornerRadius: 9999)
    }
}
