//
//  ChortDescriptionCardModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

class ChortDescriptionCardViewModel: ObservableObject {
    //MARK: - Properties
    @Published var vacancy: VacancyModel
    @Published var isFavorite: Bool
    let database =  RealmService.shared
    /// Formatted string representing the number of people currently viewing the vacancy.
    var lookingNumber: String? {
        guard let number = vacancy.lookingNumber else {
            return nil
        }
        let numberFormat = NumberFormat(formatType: .viewing)
        return numberFormat.formatNumber(number: number)
    }
    //MARK: -  init
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
        self.isFavorite = vacancy.isFavorite
    }
    // MARK: - Methods
    /// Toggles the favorite status of the vacancy.
    ///
    /// This method updates the favorite status of the vacancy in the Realm database based on its current status.
    func toggleFavorite() {
        if isFavorite {
            database.setUnfavoriteStatus(forVacancyWithId: vacancy.id)
        } else {
            database.setFavoriteStatus(forVacancyWithId: vacancy.id)
        }
    }
}
