import Charcoal
import UIKit

final class CharcoalTextFieldViewController: UIViewController {
    @IBOutlet var charcoalTextField1: CharcoalTextFieldView!
    @IBOutlet var charcoalTextField2: CharcoalTextFieldView!
    @IBOutlet var charcoalTextField3: CharcoalTextFieldView!
    @IBOutlet var charcoalTextField4: CharcoalTextFieldView!
    @IBOutlet var charcoalTextField5: CharcoalTextFieldView!
    @IBOutlet var charcoalTextField6: CharcoalTextFieldView!
    @IBOutlet var charcoalTextField7: CharcoalTextFieldView!

    override func viewDidLoad() {
        view.backgroundColor = CharcoalAsset.ColorPaletteGenerated.background1.color

        setupTextFieldView(charcoalTextField1)
        setupTextFieldView(charcoalTextField2)
        setupTextFieldView(charcoalTextField3)
        setupTextFieldView(charcoalTextField4)
        setupTextFieldView(charcoalTextField5)
        setupTextFieldView(charcoalTextField6)
        setupTextFieldView(charcoalTextField7)

        charcoalTextField4.showAssertiveText(text: "補助テキストです。\nここでは文字数制限を超えて文字を入力することができます。")
        charcoalTextField5.showAssertiveText(text: "ここでは文字数制限を超えて文字を入力することができません。")
        // swiftlint:disable line_length
        charcoalTextField6.showAssertiveText(text: "「文字制限を超えた場合」と「文字が入力されている間」にエラーになります。\nこの例では「文字が入力されている間」のエラーの方を優先的に表示させています。")
    }

    private func setupTextFieldView(_ charcoalTextFieldView: CharcoalTextFieldView) {
        charcoalTextFieldView.delegate = self
        let lengthLimit = charcoalTextFieldView.lengthLimit
        guard lengthLimit > 0 else {
            return
        }

        charcoalTextFieldView.updateCountLabel(text: "0" + "/" + String(lengthLimit), hasError: false)
    }

    private func showAssertiveTextIfNeeded(_ charcoalTextFieldView: CharcoalTextFieldView) {
        if charcoalTextFieldView == charcoalTextField4 {
            charcoalTextField4.showAssertiveText(text: "補助テキストです。\nここでは文字数制限を超えて文字を入力することができます。")
        } else if charcoalTextFieldView == charcoalTextField5 {
            charcoalTextField5.showAssertiveText(text: "ここでは文字数制限を超えて文字を入力することができません。")
        } else if charcoalTextFieldView == charcoalTextField6 {
            // swiftlint:disable line_length
            charcoalTextField6.showAssertiveText(text: "「文字制限を超えた場合」と「文字が入力されている間」にエラーになります。\nこの例では「文字が入力されている間」のエラーの方を優先的に表示させています。")
        }
    }

    private func textFieldDidBeginEditing(_ charcoalTextFieldView: CharcoalTextFieldView) {
        let lengthLimit = charcoalTextFieldView.lengthLimit
        guard let text = charcoalTextFieldView.charcoalTextField.text, lengthLimit > 0 else {
            return
        }
        let lengthCount = text.count

        if charcoalTextFieldView == charcoalTextField6, lengthCount > 0 {
            charcoalTextFieldView.setHasError(true)
            charcoalTextFieldView.showAssertiveText(text: "文字が入力されています。")
            return
        }

        if lengthCount > lengthLimit {
            charcoalTextFieldView.setHasError(true)
        } else {
            charcoalTextFieldView.setHasError(false)
        }
    }

    private func textField(_ charcoalTextFieldView: CharcoalTextFieldView, range: NSRange, string: String) -> Bool {
        let lengthLimit = charcoalTextFieldView.lengthLimit
        guard let text = charcoalTextFieldView.charcoalTextField.text, lengthLimit > 0 else {
            return true
        }
        let lengthCount = text.count + string.count - range.length

        if charcoalTextFieldView == charcoalTextField6 && lengthCount > 0 {
            charcoalTextFieldView.updateCountLabel(
                text: String(lengthCount) + "/" + String(lengthLimit),
                hasError: lengthCount > lengthLimit
            )
            charcoalTextFieldView.setHasError(true)
            charcoalTextFieldView.showAssertiveText(text: "文字が入力されています。")
            return true
        }

        if charcoalTextFieldView == charcoalTextField3 || charcoalTextFieldView == charcoalTextField5 {
            if lengthCount > lengthLimit {
                return lengthCount < lengthLimit
            }
        }

        if lengthCount > lengthLimit {
            charcoalTextFieldView.updateCountLabel(
                text: String(lengthCount) + "/" + String(lengthLimit),
                hasError: true
            )
            charcoalTextFieldView.setHasError(true)
            charcoalTextFieldView.showAssertiveText(text: charcoalTextFieldView.assertiveText ?? "")
        } else {
            charcoalTextFieldView.updateCountLabel(
                text: String(lengthCount) + "/" + String(lengthLimit),
                hasError: false
            )
            charcoalTextFieldView.setHasError(false)
            charcoalTextFieldView.hideAssertiveText()
            showAssertiveTextIfNeeded(charcoalTextFieldView)
        }

        return true
    }
}

// MARK: - UITextFieldDelegate

extension CharcoalTextFieldViewController: CharcoalTextFieldViewDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == charcoalTextField1.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField1)
        }

        if textField == charcoalTextField2.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField2)
        }

        if textField == charcoalTextField3.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField3)
        }

        if textField == charcoalTextField4.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField4)
        }

        if textField == charcoalTextField5.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField5)
        }

        if textField == charcoalTextField6.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField6)
        }

        if textField == charcoalTextField7.charcoalTextField {
            textFieldDidBeginEditing(charcoalTextField7)
        }
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if textField == charcoalTextField1.charcoalTextField {
            return self.textField(charcoalTextField1, range: range, string: string)
        }

        if textField == charcoalTextField2.charcoalTextField {
            return self.textField(charcoalTextField2, range: range, string: string)
        }

        if textField == charcoalTextField3.charcoalTextField {
            return self.textField(charcoalTextField3, range: range, string: string)
        }

        if textField == charcoalTextField4.charcoalTextField {
            return self.textField(charcoalTextField4, range: range, string: string)
        }

        if textField == charcoalTextField5.charcoalTextField {
            return self.textField(charcoalTextField5, range: range, string: string)
        }

        if textField == charcoalTextField6.charcoalTextField {
            return self.textField(charcoalTextField6, range: range, string: string)
        }

        if textField == charcoalTextField7.charcoalTextField {
            return self.textField(charcoalTextField7, range: range, string: string)
        }

        return true
    }
}
