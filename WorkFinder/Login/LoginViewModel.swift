//
//  LoginViewModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    //MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    /// flags
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    var user: UserModel = UserModel.shared
    /// Checks if the entered email contains valid symbols according to the email format.
    ///
    /// - Returns: A boolean value indicating whether the email format is valid.
    var doesEmailContainSymbols: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    // MARK: - Methods
    /// Checks the entered email against the stored user's email.
    ///
    /// - Parameter completion: A closure to be executed when the email check is completed, containing a boolean indicating success and an optional error.
    func checkEmail(completion: @escaping (Bool, Error?) -> Void) {
        if self.email == self.user.email {
            self.isEmailValid = true
            completion(true, nil)
        } else {
            let error = NSError(domain: "YourDomain", code: 401, userInfo: [NSLocalizedDescriptionKey: "Неправильный пароль"])
            completion(false, error)
        }
    }
    /// Checks the entered password against the stored user's password.
    ///
    /// - Parameter completion: A closure to be executed when the password check is completed, containing a boolean indicating success and an optional error.
    func checkPassword(completion: @escaping (Bool, Error?) -> Void) {
        if self.password == self.user.password {
            self.isPasswordValid = true
            completion(true, nil)
        } else {
            let error = NSError(domain: "YourDomain", code: 401, userInfo: [NSLocalizedDescriptionKey: "Неправильный пароль"])
            completion(false, error)
        }
    }
    /// Clears the entered email.
    func clearEmail() {
        email = ""
    }
    /// Clears the entered password.
    func clearPassword() {
        password = ""
    }
}
