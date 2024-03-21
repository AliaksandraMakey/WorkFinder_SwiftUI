//
//  LongDescriptionViewModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import SwiftUI

class LongDescriptionViewModel: ObservableObject {
    // MARK: - Properties
    var vacancy: VacancyModel
    // MARK: - init
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
    }
    // MARK: - Formatted Properties
    /// Formatted string for the looking number of the vacancy.
    var formattedLookingNumber: String {
         let numberFormat = NumberFormat(formatType: .looking)
         if let lookingNumber = vacancy.lookingNumber {
             return numberFormat.formatNumber(number: lookingNumber)
         } else {
             return numberFormat.formatNumber(number: 0)
         }
     }
    /// Formatted string for the applied number of the vacancy.
     var formattedAppliedNumber: String {
         let numberFormat = NumberFormat(formatType: .responding)
         if let appliedNumber = vacancy.appliedNumber {
             return numberFormat.formatNumber(number: appliedNumber)
         } else {
             return numberFormat.formatNumber(number: 0)
         }
     }
}
