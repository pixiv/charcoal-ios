import Foundation

// swiftlint:disable force_try
public let charcoalFoundation: CharcoalButtonPadding = {
    let url = Bundle.module.url(forResource: "CharcoalFoundation", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    return try! newJSONDecoder().decode(CharcoalButtonPadding.self, from: data)
}()
