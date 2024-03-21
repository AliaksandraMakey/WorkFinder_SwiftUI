//
//  ExperienceModelRealm.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import RealmSwift
import Foundation

class ExperienceModelRealm: Object {
    @objc dynamic var previewText: String = ""
    @objc dynamic var text: String = ""
}
