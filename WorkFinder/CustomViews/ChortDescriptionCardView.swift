//
//  ChortDescriptionCardView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

public struct ChortDescriptionCardView: View {
    /// properties
    let vacancy: VacancyModel
    /// states
    @State private var isFavorite: Bool
    @State private var isCardTapped = false
    //MARK: -  init
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
        _isFavorite = State(initialValue: vacancy.isFavorite)
    }
    //MARK: - body
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                if let lookingNumber = vacancy.lookingNumber {
                    HStack {
                        let formattedLookingNumber = "\(lookingNumber)".formatLookingNumber()
                        Regular14TextField(text: formattedLookingNumber, color: Color.Special.green)
                    }
                }
                Text("\(vacancy.title)")
                    .font(.medium(size: 16))
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 4) {
                    Regular14TextField(text: "\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)")
                    
                    HStack(spacing: 8) {
                        Regular14TextField(text: vacancy.company)
                        Image("check_mark")
                    }
                }
                HStack(spacing: 8) {
                    Image("experience")
                    Regular14TextField(text: vacancy.experience.previewText)
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
            .padding(.top, vacancy.lookingNumber != nil ? 0 : 16)
            .padding()
            .frame(width: geometry.size.width, height: 233)            .background(Color.Basic.gray1)
            .cornerRadius(10)
            .shadow(radius: 5)
            
            HStack {
                Spacer()
                CustomImageButton(image: "heart",
                                  width: 24, height: 24, isOn: isFavorite,
                                  imageFill: "fill_heart", color: Color.Basic.gray4,  action: {
                    isFavorite.toggle()
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
        
        if let date = dateFormatter.date(from: vacancy.publishedDate) {
            dateFormatter.dateFormat = "d MMMM"
            let formattedDate = dateFormatter.string(from: date)
            return "Опубликовано \(formattedDate)"
        } else {
            return "Дата неизвестна"
        }
    }
}


