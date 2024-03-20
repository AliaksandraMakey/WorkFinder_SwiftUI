//
//  FavoritesViewModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    let user: UserModel
    private let vacancyService = VacancyService.shared
    
    @Published var favoriteItems: [VacancyModel] = []
    
    init(user: UserModel) {
        self.user = user
        fetchFavoriteVacancies()
    }
    
    func fetchFavoriteVacancies() {
        vacancyService.getFavoriteVacancies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let vacancies):
                DispatchQueue.main.async {
                    self.favoriteItems = vacancies
                }
            case .failure(let error):
                print("Failed to fetch favorite vacancies: \(error.localizedDescription)")
            }
        }
    }
    
    func addToFavorites(vacancy: VacancyModel) {
        favoriteItems.append(vacancy)
    }
    
    func removeFromFavorites(vacancy: VacancyModel) {
        if let index = favoriteItems.firstIndex(where: { $0.id == vacancy.id }) {
            favoriteItems.remove(at: index)
        }
    }
    
    func isFavorite(vacancy: VacancyModel) -> Bool {
        return favoriteItems.contains(where: { $0.id == vacancy.id })
    }
}

