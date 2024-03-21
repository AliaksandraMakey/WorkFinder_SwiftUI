//
//  RequestModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

struct RequestModel: Codable {
    var offers: [OfferModel]
    var vacancies: [VacancyModel]
}
