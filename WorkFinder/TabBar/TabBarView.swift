//
//  TabBarView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var coordinator = TabBarCoordinator()
    @ObservedObject var viewModel = LoginViewModel()
    var user: UserModel?
    
    var body: some View {
        TabView(selection: $coordinator.currentTab) {
            ForEach(TabBarCoordinator.Tab.allCases, id: \.self) { tab in
                getView(for: tab)
                    .tabItem {
                        Label(tab.tabBarTitle, systemImage: tab.systemImageName)
                    }
                    .tag(tab)
            }
        }
        .environmentObject(coordinator)
    }
    
    func getView(for tab: TabBarCoordinator.Tab) -> some View {
        switch tab {
        case .search:
            return AnyView(SearchView())
        case .favorites:
            if user != nil {
                return AnyView(FavoritesScreenView(user: user!))
            } else {
                return AnyView(LoginScreenView(viewModel: viewModel))
            }
        case .responses:
            return AnyView(ResponsesView())
        case .messages:
            return AnyView(MessagesView())
        case .profile:
            return AnyView(ProfileView())
        }
    }
}


