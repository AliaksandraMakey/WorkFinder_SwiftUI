//
//  RealmService.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import RealmSwift

class DatabaseMigration {
    /// Performs migration for the Realm database to update the schema version.
    ///
    /// This method is responsible for configuring the Realm schema version and migration block. It checks the old schema version and performs data migration if needed to update the database schema.
    /// - Note: This method specifically handles migration to schema version 2 by updating the "userId" property of VacancyModelRealm objects.
    /// - Warning: Any changes made to the migration process or schema version should be carefully reviewed and tested to avoid data loss or corruption.
    static func migrateRealm() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 2 {
                    migration.enumerateObjects(ofType: VacancyModelRealm.className()) { oldObject, newObject in
                        newObject?["userId"] = oldObject?["userId"] ?? ""
                    }
                }
            }
        )
        Realm.Configuration.defaultConfiguration = config
        
        do {
            // Initialize Realm with the configured schema version and migration
            _ = try Realm()
        } catch {
            print("Error migrating Realm: \(error.localizedDescription)")
        }
    }
}

class RealmService {
    static let shared = RealmService()
    private var realm: Realm
    
    init() {
        do {
#warning("TODO: Пришлось мигрировать таблицы заново, так как первые таблицы при попытке привязки юзера отдельно база не отображала привязку юзера и вакансий. Решить ")
            // Initialize Realm and perform database migration if needed
            DatabaseMigration.migrateRealm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            self.realm = try Realm()
        } catch {
            print("Error initializing Realm: \(error.localizedDescription)")
            fatalError("Failed to initialize Realm")
        }
    }
    /// Saves a vacancy object to the Realm database.
    ///
    /// - Parameters:
    ///   - vacancyObject: The vacancy object to be saved.
    ///   - user: The user associated with the vacancy.
    func saveVacancyObject(_ vacancyObject: VacancyModel, user: UserModel) {
        do {
            let existingVacancy = realm.objects(VacancyModelRealm.self)
                .filter("id = %@ AND userId = %@", vacancyObject.id, user.id)
                .first
            guard existingVacancy == nil else {
                print("Vacancy already exists, skipping save")
                return
            }
            try realm.write {
                let vacancyRealm = VacancyModelRealm()
                mapVacancyObject(vacancyObject, to: vacancyRealm, user: user)
                realm.add(vacancyRealm, update: .all)
            }
        } catch {
            print("Error saving vacancy object: \(error.localizedDescription)")
        }
    }
    /// Finds a vacancy by its ID in the Realm database.
    ///
    /// - Parameter id: The ID of the vacancy to find.
    /// - Returns: The VacancyModelRealm object if found, otherwise nil.
    func findVacancyById(_ id: String) -> VacancyModelRealm? {
        return realm.objects(VacancyModelRealm.self)
            .filter("id = %@", id)
            .first
    }
    /// Sets the favorite status of a vacancy with the specified ID.
    ///
    /// - Parameters:
    ///   - id: The ID of the vacancy.
    ///   - isFavorite: A boolean value indicating whether the vacancy should be marked as favorite or not.
    func setFavoriteStatusById(forVacancyWithId id: String, isFavorite: Bool) {
        guard let vacancyToUpdate = findVacancyById(id) else {
            print("Vacancy with id \(id) not found")
            return
        }
        
        do {
            try realm.write {
                vacancyToUpdate.isFavorite = isFavorite
                realm.add(vacancyToUpdate, update: .modified)
            }
        } catch {
            print("Error updating favorite status for vacancy: \(error.localizedDescription)")
        }
    }
    /// Marks a vacancy with the specified ID as unfavorite.
    ///
    /// - Parameter id: The ID of the vacancy to mark as unfavorite.
    func setUnfavoriteStatus(forVacancyWithId id: String) {
        setFavoriteStatusById(forVacancyWithId: id, isFavorite: false)
    }
    /// Marks a vacancy with the specified ID as favorite.
    ///
    /// - Parameter id: The ID of the vacancy to mark as favorite.
    func setFavoriteStatus(forVacancyWithId id: String) {
        setFavoriteStatusById(forVacancyWithId: id, isFavorite: true)
    }
    /// Retrieves vacancies that are marked as favorite from the Realm database.
    ///
    /// - Returns: An array of VacancyModel objects that are marked as favorite.
    func getVacanciesWithUpdatedIsFavorite() -> [VacancyModel] {
        let updatedFavoriteVacancies = realm.objects(VacancyModelRealm.self)
            .filter("isFavorite = true")
        
        let mappedVacancies = updatedFavoriteVacancies.map { vacancyRealm in
            return self.mapVacancyRealmToModel(vacancyRealm)
        }
        
        return Array(mappedVacancies)
    }
    /// Retrieves all vacancies from the Realm database.
    ///
    /// - Returns: An array of all VacancyModel objects.
    func getAllVacancies() -> [VacancyModel] {
        let allVacancies = realm.objects(VacancyModelRealm.self)
        
        let uniqueVacancies = Array(Set(allVacancies))
        
        let mappedVacancies = uniqueVacancies.map { vacancyRealm in
            return self.mapVacancyRealmToModel(vacancyRealm)
        }
        
        return mappedVacancies
    }
    /// Maps data from a VacancyModel object to a VacancyModelRealm object.
    ///
    /// - Parameters:
    ///   - vacancyObject: The VacancyModel object to map from.
    ///   - vacancyRealm: The VacancyModelRealm object to map to.
    ///   - user: The user associated with the vacancy.
    private func mapVacancyObject(_ vacancyObject: VacancyModel, to vacancyRealm: VacancyModelRealm, user: UserModel) {
        vacancyRealm.id = vacancyObject.id
        vacancyRealm.userId = user.id
        vacancyRealm.lookingNumber = vacancyObject.lookingNumber ?? 0
        vacancyRealm.title = vacancyObject.title
        vacancyRealm.company = vacancyObject.company
        vacancyRealm.publishedDate = vacancyObject.publishedDate
        vacancyRealm.isFavorite = vacancyObject.isFavorite
        vacancyRealm.appliedNumber = vacancyObject.appliedNumber ?? 0
        vacancyRealm.descriptionText = vacancyObject.description
        vacancyRealm.responsibilities = vacancyObject.responsibilities
        vacancyRealm.schedules.append(objectsIn: vacancyObject.schedules)
        vacancyRealm.questions.append(objectsIn: vacancyObject.questions)
        
        // Map ExperienceModel
        let experienceRealm = ExperienceModelRealm()
        experienceRealm.previewText = vacancyObject.experience.previewText
        experienceRealm.text = vacancyObject.experience.text
        vacancyRealm.experience = experienceRealm
        
        // Map AddressModel
        let addressRealm = AddressModelRealm()
        addressRealm.town = vacancyObject.address.town
        addressRealm.street = vacancyObject.address.street
        addressRealm.house = vacancyObject.address.house
        vacancyRealm.address = addressRealm
        
        // Map SalaryModel
        let salaryRealm = SalaryModelRealm()
        salaryRealm.full = vacancyObject.salary.full
        salaryRealm.short = vacancyObject.salary.short
        vacancyRealm.salary = salaryRealm
    }
    /// Maps data from a VacancyModelRealm object to a VacancyModel object.
    ///
    /// - Parameter vacancyRealm: The VacancyModelRealm object to map from.
    /// - Returns: The mapped VacancyModel object.
    private func mapVacancyRealmToModel(_ vacancyRealm: VacancyModelRealm) -> VacancyModel {
        return VacancyModel(id: vacancyRealm.id,
                            lookingNumber: vacancyRealm.lookingNumber,
                            title: vacancyRealm.title,
                            address: AddressModel(town: vacancyRealm.address?.town ?? "",
                                                  street: vacancyRealm.address?.street ?? "",
                                                  house: vacancyRealm.address?.house ?? ""),
                            company: vacancyRealm.company,
                            experience: ExperienceModel(previewText: vacancyRealm.experience?.previewText ?? "",
                                                        text: vacancyRealm.experience?.text ?? ""),
                            publishedDate: vacancyRealm.publishedDate,
                            isFavorite: vacancyRealm.isFavorite,
                            salary: SalaryModel(full: vacancyRealm.salary?.full ?? "",
                                                short: vacancyRealm.salary?.short ?? ""),
                            schedules: Array(vacancyRealm.schedules),
                            appliedNumber: vacancyRealm.appliedNumber,
                            description: vacancyRealm.descriptionText,
                            responsibilities: vacancyRealm.responsibilities,
                            questions: Array(vacancyRealm.questions))
    }
}

