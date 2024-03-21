//
//  FavoritesViewModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    //MARK: - Properties
    let user: UserModel
    private let vacancyService = VacancyService.shared
    @Published var favoriteItems: [VacancyModel] = []
    //MARK: -  init
    init(user: UserModel) {
        self.user = user
        fetchFavoriteVacancies()
    }
    /// Returns the formatted count of favorite vacancies.
    var favoriteVacancyCount: String {
        let count = favoriteItems.count
        let numberFormat = NumberFormat(formatType: .vacancies)
        return numberFormat.formatNumber(number: count)
    }
    // MARK: - Methods
    /// Fetches favorite vacancies for the user from the backend service.
    ///
    /// This method retrieves all vacancies from the backend using `vacancyService.getAllVacancies`, filters out the favorite vacancies using `RealmService.shared.getVacanciesWithUpdatedIsFavorite`, and updates the `favoriteItems` property with the filtered list.
    func fetchFavoriteVacancies() {
        vacancyService.getAllVacancies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let allVacancies):
                let favoriteVacancyIds = RealmService.shared.getVacanciesWithUpdatedIsFavorite()
                
                DispatchQueue.main.async {
                    self.favoriteItems = favoriteVacancyIds
                }
            case .failure(let error):
                print("Failed to fetch vacancies: \(error.localizedDescription)")
            }
        }
    }
}
