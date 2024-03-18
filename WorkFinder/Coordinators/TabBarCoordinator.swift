//
//  TabBarCoordinator.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//

import SwiftUI

class TabBarCoordinator: ObservableObject {
    enum Tab {
        case search, favorites, responses, messages, profile
        
        static var allCases: [Tab] {
                 return [.search, .favorites, .responses, .messages, .profile]
             }
        var tabBarTitle: String {
                   switch self {
                   case .search:
                       return "Поиск"
                   case .favorites:
                       return "Избранное"
                   case .responses:
                       return "Отклики"
                   case .messages:
                       return "Сообщения"
                   case .profile:
                       return "Профиль"
                   }
               }
               
               var systemImageName: String {
                   switch self {
                   case .search:
                       return "magnifyingglass"
                   case .favorites:
                       return "heart"
                   case .responses:
                       return "envelope"
                   case .messages:
                       return "message"
                   case .profile:
                       return "person"
                   }
               }
             
    }
    @Published var currentTab: Tab = .favorites
}
