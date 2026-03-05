import Foundation

// swiftlint:disable force_try
public let charcoalFoundation: CharcoalFoundation = {
    let url = Bundle.module.url(forResource: "CharcoalFoundation", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    return try! newJSONDecoder().decode(CharcoalFoundation.self, from: data)
}()

public let charcoalFoundationV2: CharcoalFoundationV2 = {
    let url = Bundle.module.url(forResource: "CharcoalFoundationV2", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    return try! JSONDecoder().decode(CharcoalFoundationV2.self, from: data)
}()
