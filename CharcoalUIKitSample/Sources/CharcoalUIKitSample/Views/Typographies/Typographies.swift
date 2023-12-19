import Charcoal
import UIKit

class TypographiesViewController: UIViewController {
    enum Const {
        static let shortText = "Heavy boxes perform quick waltzes and jigs"
        // swiftlint:disable line_length
        static let longText = "Oh, wet Alex, a jar, a fag! Up, disk, curve by! Man Oz, Iraq, Arizona, my Bev? Ruck's id-pug, a far Ajax, elate? Who?"
        static let numberText = "0123456789"
    }

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.bounces = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var typographies = [
        // 20
        TypographyExample(title: "20 Bold SingleLine", content: Const.shortText, labelStyle: CharcoalTypography20.self, isSingleLine: true, isBold: true, isMono: false),
        TypographyExample(title: "20 Bold MultiLine", content: Const.longText, labelStyle: CharcoalTypography20.self, isSingleLine: false, isBold: true, isMono: false),
        TypographyExample(title: "20 Regular SingleLine", content: Const.shortText, labelStyle: CharcoalTypography20.self, isSingleLine: true, isBold: false, isMono: false),
        TypographyExample(title: "20 Regular MultiLine", content: Const.longText, labelStyle: CharcoalTypography20.self, isSingleLine: false, isBold: false, isMono: false),
        TypographyExample(title: "20 Bold Mono", content: Const.numberText, labelStyle: CharcoalTypography20.self, isSingleLine: true, isBold: true, isMono: true),
        TypographyExample(title: "20 Regular Mono", content: Const.numberText, labelStyle: CharcoalTypography20.self, isSingleLine: false, isBold: false, isMono: true),
        // 16
        TypographyExample(title: "16 Bold SingleLine", content: Const.shortText, labelStyle: CharcoalTypography16.self, isSingleLine: true, isBold: true, isMono: false),
        TypographyExample(title: "16 Bold MultiLine", content: Const.longText, labelStyle: CharcoalTypography16.self, isSingleLine: false, isBold: true, isMono: false),
        TypographyExample(title: "16 Regular SingleLine", content: Const.shortText, labelStyle: CharcoalTypography16.self, isSingleLine: true, isBold: false, isMono: false),
        TypographyExample(title: "16 Regular MultiLine", content: Const.longText, labelStyle: CharcoalTypography16.self, isSingleLine: false, isBold: false, isMono: false),
        TypographyExample(title: "16 Bold Mono", content: Const.numberText, labelStyle: CharcoalTypography16.self, isSingleLine: true, isBold: true, isMono: true),
        TypographyExample(title: "16 Regular Mono", content: Const.numberText, labelStyle: CharcoalTypography16.self, isSingleLine: false, isBold: false, isMono: true),
        // 14
        TypographyExample(title: "14 Bold SingleLine", content: Const.shortText, labelStyle: CharcoalTypography14.self, isSingleLine: true, isBold: true, isMono: false),
        TypographyExample(title: "14 Bold MultiLine", content: Const.longText, labelStyle: CharcoalTypography14.self, isSingleLine: false, isBold: true, isMono: false),
        TypographyExample(title: "14 Regular SingleLine", content: Const.shortText, labelStyle: CharcoalTypography14.self, isSingleLine: true, isBold: false, isMono: false),
        TypographyExample(title: "14 Regular MultiLine", content: Const.longText, labelStyle: CharcoalTypography14.self, isSingleLine: false, isBold: false, isMono: false),
        TypographyExample(title: "14 Bold Mono", content: Const.numberText, labelStyle: CharcoalTypography14.self, isSingleLine: true, isBold: true, isMono: true),
        TypographyExample(title: "14 Regular Mono", content: Const.numberText, labelStyle: CharcoalTypography14.self, isSingleLine: false, isBold: false, isMono: true),
        // 12
        TypographyExample(title: "12 Bold SingleLine", content: Const.shortText, labelStyle: CharcoalTypography12.self, isSingleLine: true, isBold: true, isMono: false),
        TypographyExample(title: "12 Bold MultiLine", content: Const.longText, labelStyle: CharcoalTypography12.self, isSingleLine: false, isBold: true, isMono: false),
        TypographyExample(title: "12 Regular SingleLine", content: Const.shortText, labelStyle: CharcoalTypography12.self, isSingleLine: true, isBold: false, isMono: false),
        TypographyExample(title: "12 Regular MultiLine", content: Const.longText, labelStyle: CharcoalTypography12.self, isSingleLine: false, isBold: false, isMono: false),
        TypographyExample(title: "12 Bold Mono", content: Const.numberText, labelStyle: CharcoalTypography12.self, isSingleLine: true, isBold: true, isMono: true),
        TypographyExample(title: "12 Regular Mono", content: Const.numberText, labelStyle: CharcoalTypography12.self, isSingleLine: false, isBold: false, isMono: true),
        // 10
        TypographyExample(title: "10 Bold SingleLine", content: Const.shortText, labelStyle: CharcoalTypography10.self, isSingleLine: true, isBold: true, isMono: false),
        TypographyExample(title: "10 Bold MultiLine", content: Const.longText, labelStyle: CharcoalTypography10.self, isSingleLine: false, isBold: true, isMono: false),
        TypographyExample(title: "10 Regular SingleLine", content: Const.shortText, labelStyle: CharcoalTypography10.self, isSingleLine: true, isBold: false, isMono: false),
        TypographyExample(title: "10 Regular MultiLine", content: Const.longText, labelStyle: CharcoalTypography10.self, isSingleLine: false, isBold: false, isMono: false),
        TypographyExample(title: "10 Bold Mono", content: Const.numberText, labelStyle: CharcoalTypography10.self, isSingleLine: true, isBold: true, isMono: true),
        TypographyExample(title: "10 Regular Mono", content: Const.numberText, labelStyle: CharcoalTypography10.self, isSingleLine: false, isBold: false, isMono: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        addTypograhpies()
    }

    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func addTypograhpies() {
        for typography in typographies {
            let tView = UIView(frame: .zero)
            let titleLabel = CharcoalTypography14(frame: .zero)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = typography.title

            let contentLabel = typography.labelStyle.init()
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            contentLabel.text = typography.content
            contentLabel.numberOfLines = typography.isSingleLine ? 1 : 0

            if typography.isBold {
                contentLabel.isBold = true
            }

            if typography.isMono {
                contentLabel.isMono = true
            }

            if typography.isSingleLine {
                contentLabel.numberOfLines = 1
            }

            tView.addSubview(titleLabel)
            tView.addSubview(contentLabel)

            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: tView.leadingAnchor, constant: 8),
                titleLabel.trailingAnchor.constraint(equalTo: tView.trailingAnchor, constant: -8),
                titleLabel.topAnchor.constraint(equalTo: tView.topAnchor, constant: 8),
                contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                contentLabel.leadingAnchor.constraint(equalTo: tView.leadingAnchor, constant: 8),
                contentLabel.trailingAnchor.constraint(equalTo: tView.trailingAnchor, constant: -8),
                contentLabel.bottomAnchor.constraint(equalTo: tView.bottomAnchor, constant: -8),
                tView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
            ])

            stackView.addArrangedSubview(tView)
        }
    }
}

extension TypographiesViewController {
    struct TypographyExample {
        let title: String
        let content: String
        let labelStyle: CharcoalTypographyLabel.Type
        let isSingleLine: Bool
        let isBold: Bool
        let isMono: Bool
    }
}

@available(iOS 17.0, *)
#Preview {
    let viewController = TypographiesViewController()
    return viewController
}
