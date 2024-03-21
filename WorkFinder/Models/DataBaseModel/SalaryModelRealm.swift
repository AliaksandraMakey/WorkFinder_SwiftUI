//
//  SalaryModelRealm.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import RealmSwift
import Foundation


class SalaryModelRealm: Object {
    @objc dynamic var full: String?
    @objc dynamic var short: String?
}
