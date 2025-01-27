import SwiftUI

protocol CharcoalFontModifierProtocol {
    func createFallbackFont(name: String, weight: UIFont.Weight) -> UIFontDescriptor
}

extension CharcoalFontModifierProtocol {
    func createFallbackFont(name: String, weight: UIFont.Weight) -> UIFontDescriptor {
        var attributes: [UIFontDescriptor.AttributeName : Any] = [:]
        var traits:  [UIFontDescriptor.TraitKey: Any] = [:]
        traits[.weight] = weight
        attributes[UIFontDescriptor.AttributeName.name] = nil
        attributes[UIFontDescriptor.AttributeName.family] = name
        attributes[UIFontDescriptor.AttributeName.traits] = traits
        return  UIFontDescriptor(fontAttributes: attributes)
    }
}
