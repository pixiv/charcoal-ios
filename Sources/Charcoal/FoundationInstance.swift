import Foundation

// swiftlint:disable force_try
public let charcoalFoundation: CharcoalFoundation = {
    let url = Bundle.module.url(forResource: "CharcoalFoundation", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    return try! newJSONDecoder().decode(CharcoalFoundation.self, from: data)
}()
