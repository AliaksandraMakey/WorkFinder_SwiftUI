//
//  DescriptionScreenView.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//


import UIKit
import SwiftUI

struct DescriptionScreenView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: DescriptionViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer().frame(height: geometry.size.height * 0.4)
                Text("\(viewModel.vacancy.title)")
                    .font(.semibold(size: 22))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.black)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("left")
                        .foregroundColor(.white)
                }
                Spacer().frame(width: geometry.size.width * 0.6)
                
                CustomImageButton(image: "open_eye", width: 26, height: 26) {
                    print("tap open eye")
                }
                
                Button(action: {
                    viewModel.shareVacancy()
                }) {
                    Image("share")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                }
                
                CustomImageButton(image: "heart", width: 26, height: 26, isOn: viewModel.vacancy.isFavorite, imageFill: "fill_heart") {
                }
                
            }
                .padding(.horizontal)
            )
        }
    }
}


//struct DescriptionScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        var vacancy = Vacancy(id: "123", lookingNumber: 2, title: "Software Engineer", address: Address(town: "San Francisco", street: "Main St", house: "123"), company: "TechCo", experience: Experience(previewText: "3+ years of experience", text: ""), publishedDate: "2024-03-19", isFavorite: true)
//
//        DescriptionScreenView(viewModel: DescriptionViewModel(vacancy: vacancy))
//    }
//}
