import UIKit

class SpinnerContainerView: UIView {
    let subview: UIView
    let transparentBackground: Bool
    let padding: CGFloat = 16
    
    init(subview: UIView, transparentBackground: Bool = false) {
        self.subview = subview
        self.transparentBackground = transparentBackground
        super.init(frame: CGRect.zero)
        addSubview(subview)
        
        if (!transparentBackground) {
            backgroundColor = UIColor.white
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = 8
            layer.cornerRadius = 8
            layer.shadowOpacity = 0.1
        }

        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.centerXAnchor.constraint(equalTo: centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: subview.intrinsicContentSize.width + padding * 2,
                      height: subview.intrinsicContentSize.height + padding * 2)
    }
}
