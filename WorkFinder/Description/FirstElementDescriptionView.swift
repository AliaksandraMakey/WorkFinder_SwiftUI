//
//  FirstElementDescriptionView.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import SwiftUI

struct FirstElementDescriptionView: View {
    //MARK: - Properties
    var vacancy: VacancyModel
    //MARK: - init
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
    }
    //MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer().frame(height: 16)
            // Title
            Text(vacancy.title)
                .font(.semibold(size: 22))
            // Salary
            if let salary = vacancy.salary.full {
                Text(salary)
                    .font(.regular(size: 14))
            } else {
                Text("Уровень дохода не указан")
                    .font(.regular(size: 14))
            }
            // Experience
            Text(vacancy.experience.previewText)
                .font(.regular(size: 14))
            // Schedules
            VStack(alignment: .leading, spacing: 6){
                ForEach(vacancy.schedules, id: \.self) { schedule in
                    Text(schedule)
                        .font(.regular(size: 14))
                }
            }
        }
    }
}
