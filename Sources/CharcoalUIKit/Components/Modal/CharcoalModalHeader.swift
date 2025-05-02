import CharcoalShared
import UIKit

@available(iOS 15, *)
final class CharcoalModalHeader: UIView {
    init(title: String?, closeButtonTapped: @escaping @Sendable () -> Void) {
        super.init(frame: .null)

        let titleLabel = CharcoalTypography20()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isBold = true
        titleLabel.text = title
        titleLabel.textAlignment = .center

        var configuration = UIButton.Configuration.plain()
        configuration.image = CharcoalAsset.Images.close24.image
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let closeButton = UIButton(configuration: configuration)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addAction(
            .init { _ in closeButtonTapped() },
            for: .touchUpInside
        )

        addSubview(titleLabel)
        addSubview(closeButton)

        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            closeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        CGSize(
            width: size.width,
            height: min(64, size.height)
        )
    }

    override var intrinsicContentSize: CGSize {
        CGSize(
            width: UIScreen.main.bounds.width - 48,
            height: 64
        )
    }
}

@available(iOS 17, *)
#Preview {
    let header = CharcoalModalHeader(
        title: "TitleTitleTitleTitleTitleTitleTitleTitle",
        closeButtonTapped: { print("Close button tapped") }
    )
    header.backgroundColor = CharcoalAsset.ColorPaletteGenerated.surface3.color
    header.clipsToBounds = true
    header.layer.cornerRadius = 32
    header.layer.maskedCorners = [
        .layerMinXMinYCorner,
        .layerMaxXMinYCorner,
    ]

    return header
}
