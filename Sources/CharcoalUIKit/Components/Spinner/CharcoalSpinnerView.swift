import UIKit

class CharcoalSpinnerView: UIView {
    var spinnerSize: CGFloat
    var transparentBackground: Bool
    
    private var circleLayer: CAShapeLayer!
    
    init(spinnerSize: CGFloat, transparentBackground: Bool = false) {
        self.spinnerSize = spinnerSize
        self.transparentBackground = transparentBackground
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
        
        if !transparentBackground {
            self.backgroundColor = UIColor.white
        }
        
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
}

class SpinnerPreviewView: UIView {
    let spinner = CharcoalSpinnerView(spinnerSize: 48)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spinner)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        spinner.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}

@available(iOS 17.0, *)
#Preview {
    let backgroundView = UIView()
    let spinner = SpinnerPreviewView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    spinner.translatesAutoresizingMaskIntoConstraints = false
    spinner.backgroundColor = UIColor.white
    backgroundView.addSubview(spinner)
    backgroundView.backgroundColor = UIColor.gray
    
    var constraints: [NSLayoutConstraint] = []
    
    constraints = [
        spinner.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 0),
        spinner.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 0),
        spinner.widthAnchor.constraint(equalToConstant: 64),
        spinner.heightAnchor.constraint(equalToConstant: 64)
    ]
    
    NSLayoutConstraint.activate(constraints)
    
    return backgroundView
}
