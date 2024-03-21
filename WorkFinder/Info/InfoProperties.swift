//
//  InfoProperties.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import Foundation


enum InfoProperties {
    case noNetwork
    
    //MARK: - Properties
    var warmingText: String {
        switch self {
        case .noNetwork:
            return "Что-то пошло не так. \nПроверьте подключение к интернету и обновите страницу"
        }
    }
    var image: String {
        switch self {
        case .noNetwork:
            return "bad_connection"
        }
    }
    var buttonName: String {
        switch self {
        case .noNetwork:
            return "Обновить страницу"
        }
    }
}
