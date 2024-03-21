//
//  SecondElementDescriptionView.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import SwiftUI

struct SecondElementDescriptionView: View {
    //MARK: - Properties
    var vacancy: VacancyModel
    //MARK: - init
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
    }
    //MARK: - body
    var body: some View {
        VStack(alignment: .leading) {
            // Description
            if let description = vacancy.description {
                Text(description)
                    .font(.regular(size: 14))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            VStack(alignment: .leading, spacing: 8){
                Spacer().frame(height: 32)
                Text("Ваши задачи")
                    .font(.semibold(size: 20))
                // Responsibilities
                Text(vacancy.responsibilities)
                    .font(.regular(size: 14))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer().frame(height: 32)
            VStack(alignment: .leading, spacing: 8) {
                Text("Задайте вопрос работодателю")
                    .font(.medium(size: 14))
                Text("Он получит его с откликом на вакансию")
                    .foregroundColor(Color.Basic.gray3)
                    .font(.medium(size: 14))
            }
            // Questions
            ForEach(vacancy.questions, id: \.self) { question in
                RoundedTextView(text: question)
                Spacer().frame(height: 8)
            }
            Spacer().frame(height: 16)
        }
    }
}
