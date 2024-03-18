//
//  LoginViewModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    private var user: UserModel = UserModel(email: "alex@gmail.com", password: "1111")

    
    var doesEmailContainSymbols: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    func checkEmail(completion: @escaping (Bool, Error?) -> Void) {
            if self.email  == self.user.email {
                self.isEmailValid = true
                completion(true, nil)
            } else {
                let error = NSError(domain: "YourDomain", code: 401, userInfo: [NSLocalizedDescriptionKey: "Неправильный пароль"])
                completion(false, error)
        }
    }

        
        func checkPassword(completion: @escaping (Bool, Error?) -> Void) {
                if self.password  == self.user.password {
                    self.isPasswordValid = true
                    completion(true, nil)
                } else {
                    let error = NSError(domain: "YourDomain", code: 401, userInfo: [NSLocalizedDescriptionKey: "Неправильный пароль"])
                    completion(false, error)
            }
        }

    func createUser(completion: @escaping (UserModel?, Error?) -> Void) {
        if self.isEmailValid && self.isPasswordValid {
            completion(UserModel(email: self.email, password: self.password), nil)
        } else {
            let error = NSError(domain: "YourDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "User not found"])
            completion(nil, error)
        }
    }
    
    func clearEmail() {
        email = ""
    }
    
    func clearPassword() {
        password = ""
    }
}
