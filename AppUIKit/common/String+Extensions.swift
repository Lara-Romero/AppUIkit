//
//  Extensions.swift
//  AppUIKit
//
//  Created by lara.romero on 24/10/23.
//

import Foundation

public extension String {
    func isValidEmail() -> Bool {
        let emailRegExn = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegExn)
        return emailPred.evaluate(with: self)
    }
    
    func isValidUser() -> Bool {
        let RegEx = "^(?=.*[A-Za-z])(?=.*\\d).{4,}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: self)
    }
}



