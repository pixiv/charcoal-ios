import UIKit

class CharcoalSpinnerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


@available(iOS 17.0, *)
#Preview {
    let spinner = CharcoalSpinnerView()
    return spinner
}
