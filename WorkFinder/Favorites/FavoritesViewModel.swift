//
//  FavoritesViewModel.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    let user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    @Published var favoriteItems: [String] = []
    
    func addToFavorites(item: String) {
        favoriteItems.append(item)
    }
    
    func removeFromFavorites(item: String) {
        if let index = favoriteItems.firstIndex(of: item) {
            favoriteItems.remove(at: index)
        }
    }
    
    func isFavorite(item: String) -> Bool {
        return favoriteItems.contains(item)
    }
}

