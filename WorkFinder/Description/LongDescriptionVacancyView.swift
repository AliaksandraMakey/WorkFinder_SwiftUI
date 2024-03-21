//
//  DescriptionView.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI


struct LongDescriptionVacancyView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: LongDescriptionViewModel
    var vacancy: VacancyModel {
        return viewModel.vacancy
    }
    /// state
    @State private var isModalPresented = false
    //MARK: - body
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    FirstElementDescriptionView(vacancy: vacancy)
                    
                    HStack(alignment: .center, spacing: 8) {
                        GreenStackTextWithImageView(text: viewModel.formattedAppliedNumber, imageName: "green_profile")
                        GreenStackTextWithImageView(text: viewModel.formattedLookingNumber, imageName: "green_eye")
                    }
                    .frame(height: 50)
                    // map view
                    ShortMapView(textOne: vacancy.company, textTwo: "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)")
                        .frame(height: 134)
                    SecondElementDescriptionView(vacancy: vacancy)
                    
                    WideThinButton(name: "Откликнуться", color: .Special.green, radius: 8) {
                        isModalPresented.toggle()
                        print("show ResponseVacancyView")
                    }
                    .frame(height: 48)
                    Spacer().frame(height: 50)
                }
                .padding(.horizontal, 16)
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            }
    }
}

