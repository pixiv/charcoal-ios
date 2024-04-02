import UIKit

class CharcoalSpinnerView: UIView {
    let spinnerSize: CGFloat
    
    var circleLayer: CAShapeLayer!
    
    init(spinnerSize: CGFloat) {
        self.spinnerSize = spinnerSize
        super.init(frame: CGRect(x: 0, y: 0, width: spinnerSize, height: spinnerSize))
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayer() {
        circleLayer = CAShapeLayer()
        circleLayer.fillColor = CharcoalAsset.ColorPaletteGenerated.surface4.color.cgColor
        circleLayer.opacity = 1.0
        
        self.layer.addSublayer(circleLayer)
        
        startAnimating()
    }
    
    private func startAnimating() {
        // Opacity Animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.0
        opacityAnimation.duration = 1.0
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        opacityAnimation.repeatCount = Float.infinity
        opacityAnimation.isRemovedOnCompletion = false
        
        // Path Animation
        let startPath = UIBezierPath(arcCenter: CGPoint(x: spinnerSize / 2, y: spinnerSize / 2),
                                     radius: 0.1,
                                     startAngle: 0,
                                     endAngle: CGFloat.pi * 2,
                                     clockwise: true).cgPath
        
        let endPath = UIBezierPath(arcCenter: CGPoint(x: spinnerSize / 2, y: spinnerSize / 2),
                                   radius: spinnerSize / 2,
                                   startAngle: 0,
                                   endAngle: CGFloat.pi * 2,
                                   clockwise: true).cgPath
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = startPath
        pathAnimation.toValue = endPath
        pathAnimation.duration = 1.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        pathAnimation.repeatCount = Float.infinity
        pathAnimation.isRemovedOnCompletion = false
        
        circleLayer.add(pathAnimation, forKey: "pathAnimation")
        circleLayer.add(opacityAnimation, forKey: "opacityAnimation")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: spinnerSize, height: spinnerSize)
    }
}

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
        return CGSize(width: subview.intrinsicContentSize.width + padding,
                      height: subview.intrinsicContentSize.height + padding)
    }
}

@available(iOS 17.0, *)
#Preview(traits: .sizeThatFitsLayout) {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 8.0
    
    let spinner = SpinnerContainerView(subview: CharcoalSpinnerView(spinnerSize: 48))
    let spinner2 = SpinnerContainerView(subview: CharcoalSpinnerView(spinnerSize: 100), transparentBackground: true)
    let spinner3 = SpinnerContainerView(subview: CharcoalSpinnerView(spinnerSize: 100), transparentBackground: false)
    
    stackView.addArrangedSubview(spinner)
    stackView.addArrangedSubview(spinner2)
    stackView.addArrangedSubview(spinner3)
    
    return stackView
}
