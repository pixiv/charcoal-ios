import UIKit

protocol CharcoalTypographyStyle {
    var isBold: Bool { get set }

    var isMono: Bool { get set }

    var fontSize: CGFloat { get }

    var lineHeight: CGFloat { get }

    func setupStyle()
}
