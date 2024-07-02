import UIKit

class CharcoalAnchorTrackingView: UIView {
    private var displayLink: CADisplayLink?
    private var lastFrame: CGRect?

    var locationDidUpdated: ((UIView?) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)

        addObserver(self, forKeyPath: "frame", options: [.new, .old], context: nil)

        displayLink = CADisplayLink(target: self, selector: #selector(checkPosition))
        displayLink?.add(to: .main, forMode: .common)
    }

    @objc func checkPosition() {
        let globalFrame = convert(bounds, to: nil)

        if lastFrame != globalFrame {
            lastFrame = globalFrame
            locationDidUpdated?(superview)
        }
    }

    func invalidate() {
        displayLink?.invalidate()
        displayLink = nil
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
