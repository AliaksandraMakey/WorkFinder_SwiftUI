//
//  FavoritesScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI


struct FavoritesScreenView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    let user: UserModel
    
    init(user: UserModel) {
        self.user = user
        self.viewModel = FavoritesViewModel(user: user)
    }
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Favorites")
        }
    }
}
