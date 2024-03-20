//
//  MainViewModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import Alamofire
import SwiftUI

class MainViewModel: ObservableObject {
    private let vacancyService = VacancyService.shared
    @Published var items: [VacancyModel] = []
    
    init() {
        fetchVacancies()
    }
    
    func fetchVacancies() {
        vacancyService.getAllVacancies { result in
            switch result {
            case .success(let vacancies):
                DispatchQueue.main.async {
                    self.items = vacancies
                }
            case .failure(let error):
                print("Error fetching vacancies: \(error.localizedDescription)")
            }
        }
    }
}
