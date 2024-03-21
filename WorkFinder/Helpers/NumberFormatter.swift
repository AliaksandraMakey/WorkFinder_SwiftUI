//
//  NumberFormatter.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import Foundation

struct NumberFormat {
    // Enumeration to represent different types of number formatting
    enum FormatType {
        case looking, responding, viewing, vacancies
    }
    let formatType: FormatType
    /// Function to format the number based on the format type
    ///
    /// - Parameters:
    ///   - number: The number to be formatted.
    /// - Returns: A formatted string representing the number with the appropriate suffix and prefix based on the format type.
    func formatNumber(number: Int) -> String {
        var prefix: String
        var suffix: String
        
        switch formatType {
        case .looking:
            suffix = formatSuffix(number: number, singular: "человек", plural: "человека")
            return "\(number) \(suffix) сейчас смотрят"
        case .responding:
            prefix = "уже откликнулись"
            suffix = formatSuffix(number: number, singular: "человек", plural: "человека")
            return "\(number) \(suffix) \(prefix)"
        case .viewing:
            prefix = "Сейчас смотрят"
            suffix = formatSuffix(number: number, singular: "человек", plural: "человека")
            return "\(prefix) \(number) \(suffix)"
        case .vacancies:
            prefix = ""
            suffix = formatSuffix(number: number, singular: "вакансия", plural: "вакансий")
            return "\(number) \(suffix)"
        }
    }
    /// Private function to determine the appropriate suffix based on the number
    ///
    /// - Parameters:
    ///   - number: The number to determine the suffix for.
    ///   - singular: The singular form of the suffix.
    ///   - plural: The plural form of the suffix.
    /// - Returns: The appropriate suffix based on the number.
    private func formatSuffix(number: Int, singular: String, plural: String) -> String {
        let lastDigit = number % 10
        let lastTwoDigits = number % 100
        // Special case for numbers ending in 11, 12, or 13
        if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
            return singular
        } else if lastDigit == 1 {
            return singular
        } else if lastDigit >= 2 && lastDigit <= 4 {
            return plural
        } else {
            return plural
        }
    }
}

// Function to determine the appropriate suffix based on the number
private func formatSuffix(number: Int, singular: String, plural: String) -> String {
    let lastDigit = number % 10
    let lastTwoDigits = number % 100
    // Special case for numbers ending in 11, 12, or 13
    if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
        return singular
    } else if lastDigit == 1 {
        return singular
    } else if lastDigit >= 2 && lastDigit <= 4 {
        return plural
    } else {
        return plural
    }
}

