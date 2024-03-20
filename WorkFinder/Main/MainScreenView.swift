//
//  MainScreenView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State private var selectedVacancy: VacancyModel? // Добавляем состояние для отслеживания выбранной вакансии
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Spacer().frame(height: geometry.size.height * 0.07)
                    CustomSearchBar().padding(.horizontal)
                    Spacer().frame(height: 16)
                    MainStoriesHeaderView()
                    Text("Вакансии для вас")
                        .font(.semibold(size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(viewModel.items) { vacancy in
                                // Используем NavigationLink для перехода к DiscriptionView
                                NavigationLink(destination: DescriptionScreenView(viewModel: DescriptionViewModel(vacancy: vacancy)), tag: vacancy, selection: $selectedVacancy) {
                                    ChortDescriptionCardView(vacancy: vacancy)
                                        .frame(width: geometry.size.width - 20, height: 233)
                                        .padding(.horizontal, 10)
                                        .onTapGesture {
                                            selectedVacancy = vacancy
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


#Preview {
    MainScreenView()
}

