//
//  FavoritesScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

#warning("FIXME:  после установки для isFavorite флага false не обновляет страницу при подписке на изменения, только при полном обновлении страницы")
struct FavoritesScreenView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: FavoritesViewModel
    @State private var selectedVacancyId: String?
    let user: UserModel
    //MARK: -  init
    init(user: UserModel) {
        self.user = user
        self.viewModel = FavoritesViewModel(user: user)
    }
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                Spacer() .frame(height: geometry.size.height * 0.07)
                // header
                CustomHeaderView(text: "Избранное")
                
                Text(viewModel.favoriteVacancyCount)
                    .font(.regular(size: 14))
                    .foregroundColor(Color.Basic.gray3)
                    .padding(.leading)
                // scroll view
                ScrollView {
                    VStack {
                        ForEach(viewModel.favoriteItems, id: \.id) { vacancy in
                            Spacer()
                            ChortDescriptionCardView(viewModel: ChortDescriptionCardViewModel(vacancy: vacancy))
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

