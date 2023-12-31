
import UIKit

class ExtensionStrings {
    func isValidEmail(email: String) -> Bool {
        let emailRegExn = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegExn)
        return emailPred.evaluate(with: email)
    }
}
