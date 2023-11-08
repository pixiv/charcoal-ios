import Charcoal
import UIKit

final class TextFieldsViewController: UIViewController {
    @IBOutlet var textField1: CharcoalTextFieldView!
    @IBOutlet var textField2: CharcoalTextFieldView!
    @IBOutlet var textField3: CharcoalTextFieldView!
    @IBOutlet var textField4: CharcoalTextFieldView!
    @IBOutlet var textField5: CharcoalTextFieldView!
    @IBOutlet var textField6: CharcoalTextFieldView!
    @IBOutlet var textField7: CharcoalTextFieldView!

    override func viewDidLoad() {
        view.backgroundColor = CharcoalAsset.ColorPaletteGenerated.background1.color

        textField2.lengthLimit = 10
        textField2.placeholder = "制限を超えて入力できます"
        textField2.assertiveText = "Assistive Textです。文字制限を超えて入力するとこの文章が表示されます。フォーカスを外しても赤色の枠線は消えません。"
        
        textField3.title = "Label"
        textField3.lengthLimit = 10
        textField3.placeholder = "制限を超えた入力はできません"
        
        textField4.title = "Label"
        textField4.lengthLimit = 10
        textField4.placeholder = "補助テキストがある場合"
        textField4.assertiveText = "Assistive Textです。文字制限を超えて入力するとこの文章が表示されます。フォーカスを外しても赤色の枠線は消えません。"
        textField4.showAssertiveText(text: "補助テキストです。\nここでは文字数制限を超えて文字を入力することができます。")
        
        textField5.title = "Label"
        textField5.lengthLimit = 10
        textField5.placeholder = "補助テキストがある場合"
        textField5.assertiveText = "この文字が表示されたら実装がおかしいです。"
        textField5.showAssertiveText(text: "ここでは文字数制限を超えて文字を入力することができません。")
        
        textField6.title = "Label"
        textField6.lengthLimit = 10
        textField6.placeholder = "placeholder"
        textField6.assertiveText = "これは文字制限を超えた場合のエラー文です。"
        // swiftlint:disable line_length
        textField6.showAssertiveText(text: "「文字制限を超えた場合」と「文字が入力されている間」にエラーになります。\nこの例では「文字が入力されている間」のエラーの方を優先的に表示させています。")
        
        textField7.title = "Label"
        textField7.lengthLimit = 10
        // swiftlint:disable line_length
        textField7.showAssertiveText(text: "Assistive textが入ります。Assistive textが入ります。ここにAssistive textが入ります。Assistive textが入ります。Assistive textが入ります。")
        
        setupTextFieldView(textField1)
        setupTextFieldView(textField2)
        setupTextFieldView(textField3)
        setupTextFieldView(textField4)
        setupTextFieldView(textField5)
        setupTextFieldView(textField6)
        setupTextFieldView(textField7)
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
        if charcoalTextFieldView == textField4 {
            textField4.showAssertiveText(text: "補助テキストです。\nここでは文字数制限を超えて文字を入力することができます。")
        } else if charcoalTextFieldView == textField5 {
            textField5.showAssertiveText(text: "ここでは文字数制限を超えて文字を入力することができません。")
        } else if charcoalTextFieldView == textField6 {
            // swiftlint:disable line_length
            textField6.showAssertiveText(text: "「文字制限を超えた場合」と「文字が入力されている間」にエラーになります。\nこの例では「文字が入力されている間」のエラーの方を優先的に表示させています。")
        }
    }

    private func textFieldDidBeginEditing(_ charcoalTextFieldView: CharcoalTextFieldView) {
        let lengthLimit = charcoalTextFieldView.lengthLimit
        guard let text = charcoalTextFieldView.charcoalTextField.text, lengthLimit > 0 else {
            return
        }
        let lengthCount = text.count

        if charcoalTextFieldView == textField6, lengthCount > 0 {
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

        if charcoalTextFieldView == textField6 && lengthCount > 0 {
            charcoalTextFieldView.updateCountLabel(
                text: String(lengthCount) + "/" + String(lengthLimit),
                hasError: lengthCount > lengthLimit
            )
            charcoalTextFieldView.setHasError(true)
            charcoalTextFieldView.showAssertiveText(text: "文字が入力されています。")
            return true
        }

        if charcoalTextFieldView == textField3 || charcoalTextFieldView == textField5 {
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

extension TextFieldsViewController: CharcoalTextFieldViewDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textField1.charcoalTextField {
            textFieldDidBeginEditing(textField1)
        }

        if textField == textField2.charcoalTextField {
            textFieldDidBeginEditing(textField2)
        }

        if textField == textField3.charcoalTextField {
            textFieldDidBeginEditing(textField3)
        }

        if textField == textField4.charcoalTextField {
            textFieldDidBeginEditing(textField4)
        }

        if textField == textField5.charcoalTextField {
            textFieldDidBeginEditing(textField5)
        }

        if textField == textField6.charcoalTextField {
            textFieldDidBeginEditing(textField6)
        }

        if textField == textField7.charcoalTextField {
            textFieldDidBeginEditing(textField7)
        }
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if textField == textField1.charcoalTextField {
            return self.textField(textField1, range: range, string: string)
        }

        if textField == textField2.charcoalTextField {
            return self.textField(textField2, range: range, string: string)
        }

        if textField == textField3.charcoalTextField {
            return self.textField(textField3, range: range, string: string)
        }

        if textField == textField4.charcoalTextField {
            return self.textField(textField4, range: range, string: string)
        }

        if textField == textField5.charcoalTextField {
            return self.textField(textField5, range: range, string: string)
        }

        if textField == textField6.charcoalTextField {
            return self.textField(textField6, range: range, string: string)
        }

        if textField == textField7.charcoalTextField {
            return self.textField(textField7, range: range, string: string)
        }

        return true
    }
}
