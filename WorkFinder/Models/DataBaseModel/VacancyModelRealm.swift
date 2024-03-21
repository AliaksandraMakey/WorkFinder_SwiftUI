//
//  VacancyModelRealm.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import RealmSwift
import Foundation

class VacancyModelRealm: Object {
    @objc dynamic var userId: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var lookingNumber: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var publishedDate: String = ""
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var appliedNumber: Int = 0
    @objc dynamic var descriptionText: String?
    @objc dynamic var responsibilities: String = ""
    let schedules = List<String>()
    let questions = List<String>()
    @objc dynamic var experience: ExperienceModelRealm?
    @objc dynamic var address: AddressModelRealm?
    @objc dynamic var salary: SalaryModelRealm?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
