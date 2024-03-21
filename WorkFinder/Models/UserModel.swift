//
//  UserModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI
import RealmSwift


class UserModel: ObservableObject {
   static let shared = UserModel(id: "12345", email: "alex@gmail.com", password: "1111")
    var id: String
    var email: String
    var password: String
    
    init(id: String, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}
