public typealias ActionCallback = () -> Void

public struct CharcoalAction {
    let title: String
    let actionCallback: ActionCallback

    public init(title: String, actionCallback: @escaping ActionCallback) {
        self.title = title
        self.actionCallback = actionCallback
    }
}
