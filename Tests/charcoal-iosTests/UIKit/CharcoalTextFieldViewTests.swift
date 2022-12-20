@testable import Charcoal
import XCTest

private let supplementaryText = "SupplementaryText."
private let assertiveTextWithLengthLimit = "AssertiveTextWithLengthLimit."
private let assertiveText = "AssertiveText."

private let borderIdentifireBrand = "net.pixiv.color.brand"
private let borderIdentifireAssertive = "net.pixiv.color.assertive"

final class CharcoalTextFieldViewTests: XCTestCase {
    let textFieldView: CharcoalTextFieldView!

    override func setUp() {
        textFieldView = CharcoalTextField()
    }

    override func tearDown() {
        textFieldView = nil
    }
}

// MARK: - AssertiveTextLabel

extension CharcoalTextFieldViewTests {
    func test_文字制限を超えた際にassertiveTextが正しく表示されていること() {
        textFieldView.assertiveText = assertiveTextWithLengthLimit
        textFieldView.showAssertiveText()
        textFieldView.setHasError(true)
        XCTAssertFalse(textFieldView.assertiveTextLabel.isHidden)
        XCTAssertEqual(textFieldView.assertiveTextLabel.text, assertiveTextWithLengthLimit)
        XCTAssertEqual(textFieldView.assertiveTextLabel.textColor, UIColor.charcoal.semanticAssertive)
    }

    func test_設定したassertiveTextが正しく表示されていること() {
        textFieldView.assertiveText = assertiveTextWithLengthLimit
        textFieldView.showAssertiveText(text: assertiveText)
        textFieldView.setHasError(true)
        XCTAssertFalse(textFieldView.assertiveTextLabel.isHidden)
        XCTAssertEqual(textFieldView.assertiveTextLabel.text, assertiveText)
        XCTAssertEqual(textFieldView.assertiveTextLabel.textColor, UIColor.charcoal.semanticAssertive)
    }

    func test_設定したsupplementaryTextが正しく表示されていること() {
        textFieldView.assertiveText = assertiveTextWithLengthLimit
        textFieldView.showAssertiveText(text: supplementaryText)
        textFieldView.setHasError(false)
        XCTAssertFalse(textFieldView.assertiveTextLabel.isHidden)
        XCTAssertEqual(textFieldView.assertiveTextLabel.text, supplementaryText)
        XCTAssertEqual(textFieldView.assertiveTextLabel.textColor, UIColor.charcoal.onSurfaceText3)
    }

    func test_エラー文や補助文を切り替えても最初に設定したassertiveTextは初期化されないこと() {
        textFieldView.assertiveText = assertiveTextWithLengthLimit
        textFieldView.showAssertiveText(text: supplementaryText)
        textFieldView.setHasError(false)
        textFieldView.showAssertiveText(text: assertiveText)
        textFieldView.setHasError(true)
        textFieldView.showAssertiveText(text: supplementaryText)
        textFieldView.setHasError(false)
        textFieldView.showAssertiveText()
        textFieldView.setHasError(true)
        XCTAssertFalse(textFieldView.assertiveTextLabel.isHidden)
        XCTAssertEqual(textFieldView.assertiveTextLabel.text, assertiveTextWithLengthLimit)
        XCTAssertEqual(textFieldView.assertiveTextLabel.textColor, UIColor.charcoal.semanticAssertive)
    }
}

// MARK: - BorderLayer

extension CharcoalTextFieldViewTests {
    func test_初期化時にはボーダーが存在しないこと() {
        XCTAssertFalse(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireBrand))
        XCTAssertFalse(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireAssertive))
    }

    func test_hasErrorがtrueの際にボーダー色がbrandに適用されていること() {
        textFieldView.setHasError(true)
        XCTAssertTrue(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireBrand))
        XCTAssertFalse(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireAssertive))
    }

    func test_hasErrorがfalseの際にボーダー色がassertiveに適用されていること() {
        textFieldView.setHasError(false)
        XCTAssertFalse(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireBrand))
        XCTAssertTrue(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireAssertive))
    }

    func test_ボーダーの切り替えが正しく動作していること() {
        textFieldView.setHasError(true)
        textFieldView.setHasError(false)
        XCTAssertFalse(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireBrand))
        XCTAssertTrue(textFieldView.charcoalTextField.layers.map { $0.name }.contains(borderIdentifireAssertive))
    }
}
