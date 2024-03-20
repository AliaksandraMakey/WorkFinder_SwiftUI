//
//  VacancyModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

struct VacancyModel: Codable, Identifiable, Hashable, Equatable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: AddressModel
    let company: String
    let experience: ExperienceModel
    let publishedDate: String
    let isFavorite: Bool
    let salary: SalaryModel
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: VacancyModel, rhs: VacancyModel) -> Bool {
        return lhs.id == rhs.id
    }
}
