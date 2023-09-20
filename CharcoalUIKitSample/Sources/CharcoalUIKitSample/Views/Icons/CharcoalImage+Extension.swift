import Foundation
import Charcoal

extension CharcoalAsset.Images {
    var description: String {
        return String(String(reflecting: self).split(separator: ".").last ?? "")
    }
}
