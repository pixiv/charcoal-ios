import CharcoalUIKitSample
import SwiftUI

struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return ContentViewController.instantiate()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

@main
struct UIKitSampleIos16App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
