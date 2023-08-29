import UIKit

@IBDesignable
public class CharcoalSwitchingButton: UIView {
    public var isOn: Bool = false {
        didSet {
            updateStyle()
        }
    }

    private var onButton: UIButton?
    private var offButton: UIButton?

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public var intrinsicContentSize: CGSize {
        let onButtonSize = onButton?.intrinsicContentSize ?? .zero
        let offButtonSize = offButton?.intrinsicContentSize ?? .zero
        return CGSize(
            width: max(onButtonSize.width, offButtonSize.width),
            height: max(onButtonSize.height, offButtonSize.height)
        )
    }

    public func register<T1: UIButton, T2: UIButton>(
        onButton: T1,
        offButton: T2
    ) where T1: CharcoalButton, T2: CharcoalButton {
        self.onButton = onButton
        self.offButton = offButton
        // すでにStoryboard等でsubviewsに設定されている可能性を考慮する
        if !subviews.contains(onButton) {
            addSubview(onButton)
        }
        if !subviews.contains(offButton) {
            addSubview(offButton)
        }

        onButton.translatesAutoresizingMaskIntoConstraints = false
        onButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        onButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        offButton.translatesAutoresizingMaskIntoConstraints = false
        offButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        offButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private func updateStyle() {
        onButton?.isHidden = !isOn
        offButton?.isHidden = isOn
    }
}
