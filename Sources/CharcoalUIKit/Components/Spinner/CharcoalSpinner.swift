import UIKit

public class CharcoalSpinner: UIView {
    var mainWindow: UIWindow!
}

extension CharcoalSpinner {
    /// Initializes the spinner with the given window.
    func setupWindow(window: UIWindow?) {
        if let window = window {
            mainWindow = window
        } else {
            if (mainWindow == nil) {
                let scene = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
                                    .filter { $0.activationState == .foregroundActive }
                                    .first
                mainWindow = scene?.windows.filter { $0.isKeyWindow }.first ?? UIApplication.shared.windows.first
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let spinner = CharcoalSpinner()
    return spinner
}
