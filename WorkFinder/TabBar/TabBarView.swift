//
//  TabBarView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//

import SwiftUI

struct TabBarView: View {
    //MARK: - Properties
    @ObservedObject var coordinator = TabBarCoordinator()
    @ObservedObject var viewModel = LoginViewModel()
    var user: UserModel?
    
    var body: some View {
        ZStack {
            contentView(for: coordinator.currentTab)
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 6) {
                    Divider().background(Color.Basic.gray4)
                    HStack(spacing: 36) {
                        ForEach(TabBarCoordinator.Tab.allCases, id: \.self) { tab in
                            TabBarButton(imageName: tab.imageName, title: tab.tabBarTitle, isSelected: coordinator.currentTab == tab) {
                                coordinator.currentTab = tab
                            }
                        }
                    }   .padding(.bottom)
                }
                .background(Color.Basic.black)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .environmentObject(coordinator)
}

    //MARK: - Presenters
    func contentView(for tab: TabBarCoordinator.Tab) -> some View {
        switch tab {
        case .search:
            return AnyView(MainScreenView())
        case .favorites:
            let user = UserModel(email: "alex", password: "1111")
//            if let user = user {
                return AnyView(FavoritesScreenView(user: user))
//            } else {
//                return AnyView(LoginScreenView(viewModel: viewModel))
//            }
        case .responses:
            return AnyView(ResponsesView())
        case .messages:
            return AnyView(MessagesView())
        case .profile:
            return AnyView(ProfileView())
        }
    }
}

