//
//  InfoProperties.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import Foundation

enum InfoProperties {
    case noNetwork
    
    var warmingText: String {
        switch self {
            
        case .noNetwork:
            return "Нет интернета"
        }
    }
    var image: String {
        switch self {
        case .noNetwork:
            return "bad_connection"
        }
    }
    var buttonText: String {
        switch self {
            
        case .noNetwork:
            return "Нет интернета"
        }
    }
}
