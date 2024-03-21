//
//  AddressModelRealm.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import Foundation
import RealmSwift

class AddressModelRealm: Object {
    @objc dynamic var town: String = ""
    @objc dynamic var street: String = ""
    @objc dynamic var house: String = ""
}
