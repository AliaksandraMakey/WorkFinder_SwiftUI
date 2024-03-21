//
//  ChortDescriptionCardView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

struct ChortDescriptionCardView: View {
    //MARK: - Properties
    let viewModel: ChortDescriptionCardViewModel
    /// states
    @State private var isFavorite: Bool
    @State private var isCardTapped = false
    //MARK: -  init
    init(viewModel: ChortDescriptionCardViewModel) {
        self.viewModel = viewModel
        _isFavorite = State(initialValue: viewModel.vacancy.isFavorite)
    }
    //MARK: - body
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                if let number = viewModel.lookingNumber {
                    HStack {
                        Regular14TextField(text: number, color: Color.Special.green)
                    }
                }
                Text("\(viewModel.vacancy.title)")
                    .font(.medium(size: 16))
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 4) {
                    Regular14TextField(text: "\(viewModel.vacancy.address.town), \(viewModel.vacancy.address.street), \(viewModel.vacancy.address.house)")
                    
                    HStack(spacing: 8) {
                        Regular14TextField(text: viewModel.vacancy.company)
                        Image("check_mark")
                    }
                }
                HStack(spacing: 8) {
                    Image("experience")
                    Regular14TextField(text: viewModel.vacancy.experience.previewText)
                }
                Regular14TextField(text: formattedPublishedDate())
                WideThinButton(name: "Откликнуться") {
                    print("tap: Откликнуться")
                }
                .frame(height: 32)
                .opacity(isCardTapped ? 0 : 1)
                
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isCardTapped = true
                    }
            }
            .padding(.top, viewModel.vacancy.lookingNumber != nil ? 0 : 16)
            .padding()
            .frame(width: geometry.size.width, height: 233)          
            .background(Color.Basic.gray1)
            .cornerRadius(10)
            .shadow(radius: 5)
            
            HStack {
                Spacer()
                CustomImageButton(image: "heart",
                                  width: 24, height: 24, isOn: isFavorite,
                                  imageFill: "fill_heart", color: Color.Basic.gray4,  action: {
                    isFavorite.toggle()
                    viewModel.toggleFavorite()
                })
                
                .padding(.top, 16)
                .padding(.trailing, 16)
            }
        }
    }
#warning("FIXME: - при выносе метода в расширение и использовании метод перестает конвертировать месяц на русс языке.")
    //MARK: - Metods
    /// Formats the published date of the vacancy.
    ///
    /// - Returns: A formatted string representing the published date.
    private func formattedPublishedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale =  Locale(identifier: "ru_RU")
        
        if let date = dateFormatter.date(from: viewModel.vacancy.publishedDate) {
            dateFormatter.dateFormat = "d MMMM"
            let formattedDate = dateFormatter.string(from: date)
            return "Опубликовано \(formattedDate)"
        } else {
            return "Дата неизвестна"
        }
    }
}


