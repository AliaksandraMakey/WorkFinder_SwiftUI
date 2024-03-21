//
//  MainScreenView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

struct MainScreenView: View {
    //MARK: - Properties
    @ObservedObject var viewModel = MainViewModel()
    @State private var selectedVacancyId: String?
    //MARK: -  body
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Spacer().frame(height: geometry.size.height * 0.07)
                    // search bar
                    CustomSearchBar().padding(.horizontal)
                    Spacer().frame(height: 16)
                    // stories header
                    MainStoriesHeaderView()
                    Text("Вакансии для вас")
                        .font(.semibold(size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    // scroll view
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.items, id: \.id) { vacancy in
                                
                                NavigationLink(destination: DescriptionScreenView(viewModel: DescriptionViewModel(vacancy: vacancy)), tag: vacancy.id, selection: $selectedVacancyId) {
                                    // links
                                    ChortDescriptionCardView(viewModel: ChortDescriptionCardViewModel(vacancy: vacancy))
                                        .frame(width: geometry.size.width - 20, height: 233)
                                        .padding(.horizontal, 10)
                                        .onTapGesture {
                                            selectedVacancyId = vacancy.id
                                        }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all)
                .background(Color.Basic.black)
            }
        }
    }
}

