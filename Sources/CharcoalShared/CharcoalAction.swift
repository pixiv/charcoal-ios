public typealias ActionCallback = () -> Void

public struct CharcoalAction {
    public let title: String
    public let actionCallback: ActionCallback

    public init(title: String, actionCallback: @escaping ActionCallback) {
        self.title = title
        self.actionCallback = actionCallback
    }
}
