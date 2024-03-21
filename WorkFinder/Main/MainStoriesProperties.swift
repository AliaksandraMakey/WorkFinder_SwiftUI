//
//  MainStoriesProperties.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

enum MainStoriesProperties: CaseIterable {
    case nearVacancies, levelUpResume, temporaryJob
    
    var text: String {
        switch self {
            case .nearVacancies:
                return "Вакансии \nрядом с вами"
            case .levelUpResume:
                return "Поднять резюме в поиске"
            case .temporaryJob:
                return "Временная \nработа и \nподработка"
        }
    }
    
    var imageName: String {
        switch self {
            case .nearVacancies:
                return "circle_jobs_position"
            case .levelUpResume:
                return "circle_star"
            case .temporaryJob:
                return "circle_jobs"
        }
    }
    
    var buttomName: String? {
        switch self {
        case .nearVacancies, .temporaryJob:
            return nil
        case .levelUpResume:
            return "Поднять"
        }
    }
        var color: Color {
            switch self {
            case .nearVacancies:
                    return Color.Special.blue
            case .levelUpResume, .temporaryJob:
                return Color.Special.green
            }
    }
}
