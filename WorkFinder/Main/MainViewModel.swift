//
//  MainViewModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import Alamofire
import SwiftUI

class MainViewModel: ObservableObject {
    //MARK: - Properties
    private let vacancyService = VacancyService.shared
    @Published var items: [VacancyModel] = []
    var database = RealmService.shared
    //MARK: -  init
    init() {
        fetchVacancies()
    }
    // MARK: - Methods
        /// Fetches vacancies from the backend service and saves them to the database.
        ///
        /// This method retrieves all vacancies from the backend using `vacancyService.getAllVacancies` and saves each vacancy to the local Realm database using `database.saveVacancyObject`. After saving all vacancies, it updates the `items` property with the updated list of vacancies from the database.
        func fetchVacancies() {
        vacancyService.getAllVacancies { result in
            switch result {
            case .success(let vacancies):
                let dispatchGroup = DispatchGroup()
                
                for vacancy in vacancies {
                    dispatchGroup.enter()
                    self.database.saveVacancyObject(vacancy, user: UserModel.shared)
                    dispatchGroup.leave()
                }
                dispatchGroup.notify(queue: .main) {
                    var allVacancy = self.database.getAllVacancies()
                    self.items = [allVacancy[0], allVacancy[1], allVacancy[2]]
                }
            case .failure(let error):
                print("Error fetching vacancies: \(error.localizedDescription)")
            }
        }
    }
}
