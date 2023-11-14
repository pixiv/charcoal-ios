import UIKit

open class CharcoalTypographyLabel: UILabel, CharcoalTypographyStyle {
    public var isBold: Bool = false  {
        didSet {
            setupStyle()
        }
     }
    
    public var isMono: Bool = false {
        didSet {
            setupStyle()
        }
     }
    
    public var fontSize: CGFloat {
        get {
            fatalError("Subclass must implement the 'fontSize' property")
        }
    }
    
    public var lineHeight: CGFloat{
        get {
            fatalError("Subclass must implement the 'lineHeight' property")
        }
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        configStyle()
        setupStyle()
    }
}

extension CharcoalTypographyStyle where Self: UILabel {
    func setupStyle() {
        setupFont(fontSize: fontSize, isBold: isBold, isMono: isMono)
        if isMono {
            numberOfLines = 1
        } else {
            setupLineHeight(lineHeight: lineHeight)
        }
    }
}
