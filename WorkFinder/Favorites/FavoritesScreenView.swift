//
//  FavoritesScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

#warning ("TODO: сделать сохранение вакансий в бд и отображать")
struct FavoritesScreenView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    let user: UserModel
    
    init(user: UserModel) {
        self.user = user
        self.viewModel = FavoritesViewModel(user: user)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer() .frame(height: geometry.size.height * 0.07)
                CustomHeaderView(text: "Избранное")
                
                Text("\(viewModel.favoriteItems.count)".formatVacancyCount())
                    .font(.regular(size: 14))
                    .foregroundColor(Color.Basic.gray3)
                    .padding(.leading)
                ScrollView {
                    VStack {
                        ForEach(viewModel.favoriteItems, id: \.id) { vacancy in
                            Spacer()
                                ChortDescriptionCardView(vacancy: vacancy)
                                    .frame(width: geometry.size.width - 20, height: 233)
                           
                            }
                        .padding(.horizontal, 10)
                        }
                    }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.Basic.black)
        }
    }
}
