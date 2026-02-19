import UIKit

/**
    Displays a spinner on the screen.
    # Example #
    ```swift
    CharcoalSpinner.show()
    ```
 */
public class CharcoalSpinner: UIView {
    /// The window to display the spinner in.
    var mainView: UIView!
    /// The background view of the spinner.
    var backgroundView: UIView?
    /// The container view of the spinner.
    var containerView: UIView?

    static let shared = CharcoalSpinner()
}

// MARK: - Window

extension CharcoalSpinner {
    /// Initializes the spinner with the given window.
    func setupView(view: UIView?) {
        if let view = view {
            mainView = view
        } else {
            if mainView == nil {
                let scene = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first { $0.activationState == .foregroundActive }
                mainView = scene?.windows.first { $0.isKeyWindow } ?? scene?.windows.first
            }
        }
    }
}

// MARK: - Background

extension CharcoalSpinner {
    private func removeBackground() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }

    private func setupBackground(_ interactionPassthrough: Bool) {
        if backgroundView == nil {
            let bounds = mainView.bounds
            backgroundView = UIView(frame: bounds)

            guard let backgroundView = backgroundView else {
                fatalError("Background view is nil.")
            }
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(backgroundView)

            let constraints: [NSLayoutConstraint] = [
                backgroundView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0),
                backgroundView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
                backgroundView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0),
                backgroundView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 0)
            ]

            NSLayoutConstraint.activate(constraints)
        }

        backgroundView?.isUserInteractionEnabled = interactionPassthrough ? false : true
    }
}

// MARK: - Container

extension CharcoalSpinner {
    private func removeContainer() {
        containerView?.removeFromSuperview()
        containerView = nil
    }

    private func setupContainer(subview: UIView, transparentBackground: Bool = false) {
        if containerView == nil {
            containerView = SpinnerContainerView(subview: subview, transparentBackground: transparentBackground)
            containerView?.alpha = 0
            guard let containerView = containerView else {
                fatalError("Container view is nil.")
            }

            containerView.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(containerView)

            let constraints: [NSLayoutConstraint] = [
                containerView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: 0),
                containerView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0)
            ]

            NSLayoutConstraint.activate(constraints)
        }
    }
}

// MARK: - Spinner, Show, Dismiss

extension CharcoalSpinner {
    func show(
        spinnerSize: CGFloat = 48,
        transparentBackground: Bool = false,
        interactionPassthrough: Bool,
        on view: UIView? = nil
    ) {
        setupView(view: view)
        setupBackground(interactionPassthrough)
        setupContainer(subview: CharcoalSpinnerView(spinnerSize: spinnerSize), transparentBackground: transparentBackground)
        display()
    }

    @objc func dismiss() {
        // Hide with animation
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.containerView?.alpha = 0
        }) { [weak self] _ in
            self?.removeContainer()
            self?.removeBackground()
            self?.removeFromSuperview()
        }
    }

    func display() {
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.containerView?.alpha = 1
        })
    }
}

// MARK: Class Show, Dismiss

public extension CharcoalSpinner {
    /**
        Displays a spinner on the screen.
        - Parameters:
            - spinnerSize: The size of the spinner view.
            - transparentBackground: Whether the background of the spinner view is transparent.
            - interactionPassthrough: Whether the spinner background should pass through user interactions.
            - view: The window or view to display the spinner in.

        # Example #
        ```swift
        CharcoalSpinner.show()
        ```
     */
    class func show(
        spinnerSize: CGFloat = 48,
        transparentBackground: Bool = false,
        interactionPassthrough: Bool = false,
        on view: UIView? = nil
    ) {
        DispatchQueue.main.async {
            shared.show(spinnerSize: spinnerSize, transparentBackground: transparentBackground, interactionPassthrough: interactionPassthrough, on: view)
        }
    }

    /**
        Dismisses the spinner.

        # Example #
        ```swift
        CharcoalSpinner.dismiss()
        ```
     */
    class func dismiss() {
        DispatchQueue.main.async {
            shared.dismiss()
        }
    }
}

class CharcoalSpinnerPreview: UIView {
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8.0

        let button = CharcoalPrimaryMButton()
        button.addTarget(self, action: #selector(showNormalSpinner), for: .touchUpInside)
        button.setTitle("Normal", for: .normal)

        let transparentButton = CharcoalPrimaryMButton()
        transparentButton.addTarget(self, action: #selector(showTransparentSpinner), for: .touchUpInside)
        transparentButton.setTitle("Transparent", for: .normal)

        let dismissButton = CharcoalDefaultMButton()
        dismissButton.addTarget(self, action: #selector(dismissSpinner), for: .touchUpInside)
        dismissButton.setTitle("Dismiss", for: .normal)

        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(transparentButton)
        stackView.addArrangedSubview(dismissButton)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            stackView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    @objc func showNormalSpinner() {
        CharcoalSpinner.show(interactionPassthrough: false)
    }

    @objc func showTransparentSpinner() {
        CharcoalSpinner.show(transparentBackground: true, interactionPassthrough: true)
    }

    @objc func dismissSpinner() {
        CharcoalSpinner.dismiss()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 17.0, *)
#Preview {
    let view = CharcoalSpinnerPreview()
    return view
}
