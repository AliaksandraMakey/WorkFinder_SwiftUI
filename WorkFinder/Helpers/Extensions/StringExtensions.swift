//
//  StringExtensions.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import Foundation

extension String {
    /// Formats the number of people looking into a human-readable string with appropriate suffix.
    ///
    /// - Returns: A formatted string representing the number of people looking.
    func formatLookingNumber() -> String {
        guard let lookingNumber = Int(self) else {
            return "Некорректное число"
        }
        var suffix: String
        
        let lastDigit = lookingNumber % 10
        let lastTwoDigits = lookingNumber % 100
        
        switch lastDigit {
        case 1:
            suffix = "человек"
        case 2...4:
            suffix = "человека"
        default:
            suffix = "человек"
        }
        
        if lastTwoDigits >= 11 && lastTwoDigits <= 14 {
            suffix = "человек"
        }
        return "Сейчас просматривает \(lookingNumber) \(suffix)"
    }
    /// Formats the count of vacancies into a human-readable string with appropriate suffix.
    ///
    /// - Returns: A formatted string representing the count of vacancies.
    func formatVacancyCount() -> String {
        guard let count = Int(self) else {
            return "Некорректное число"
        }
        let suffix: String
        if count == 1 {
            suffix = "вакансия"
        } else if count > 1 && count < 5 {
            suffix = "вакансии"
        } else {
            suffix = "вакансий"
        }
        
        return "\(count) \(suffix)"
    }
}
