import UIKit

public class CharcoalTypographyLabel: UILabel, CharcoalTypographyStyle {
    public var isBold: Bool = false {
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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
}

extension CharcoalTypographyStyle where Self: UILabel {
    func setupStyle() {
        setupFont(fontSize: fontSize, isBold: isBold, isMono: isMono)
        adjustsFontForContentSizeCategory = true
        if isMono {
            numberOfLines = 1
        } else {
            setupLineHeight(lineHeight: lineHeight)
        }
    }
}
