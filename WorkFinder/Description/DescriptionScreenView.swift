//
//  DescriptionScreenView.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//


import SwiftUI

struct DescriptionScreenView: View {
    //MARK: - Properties
    
    @ObservedObject var viewModel: DescriptionViewModel
    @Environment(\.presentationMode) var presentationMode
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
                        VStack {
                DescriptionNavigationBarView(action1: {
                    print("tap open eye")
                }, action2: {
                    viewModel.shareVacancy()
                }, action3: {
                    print("tap heart")
                })
                .padding(.horizontal, 6)
                // scroll view
                ScrollView {
                    LongDescriptionVacancyView(viewModel: LongDescriptionViewModel(vacancy: viewModel.vacancy))
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .background(Color.black)
        }
    }
}


