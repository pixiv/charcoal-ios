import UIKit

public class CharcoalSwitch: UISwitch {
    override public var isEnabled: Bool {
        didSet {
            updateStyle()
        }
    }

    override public var isOn: Bool {
        didSet {
            updateStyle()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    private func setupStyle() {
        onTintColor = CharcoalAsset.ColorPaletteGenerated.brand.color
        subviews.first?.subviews.first?.backgroundColor = CharcoalAsset.ColorPaletteGenerated.text3.color
        addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        updateStyle()
    }

    @objc func valueChanged() {
        updateStyle()
    }

    private func updateStyle() {
        alpha = isEnabled ? 1 : 0.64
    }
}

@available(iOS 17.0, *)
#Preview {
    let button = CharcoalSwitch()
    return button
}
