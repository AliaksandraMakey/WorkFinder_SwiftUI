//
//  UserModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

class UserModel: ObservableObject {
    var email: String
    var password: String
    
     init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
