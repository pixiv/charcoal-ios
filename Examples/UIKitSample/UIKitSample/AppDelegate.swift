import CharcoalUIKitSample
import UIKit
import Charcoal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        CharcoalConfig.configUIKit.fixedSizeCategory = .large
        
        let viewController = ContentViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
        return true
    }
}
