//
//  EmployeeSearchView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct EmployeeSearchView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 24)
                CustomTextWithLayerView(textLabel: ("Поиск сотрудников"), width: 0.4, fontSize: 16)
            Spacer().frame(height: 8)
                Text("Размещение вакансий и доступ к базе резюме")
                    .font(.regular(size: 14))
                    .foregroundColor(.white)
            Spacer().frame(height: 16)
            WideThinButton(name: "Я ищу сотрудников") {
                print("tap: Я ищу сотрудников")
            }
            Spacer().frame(height: 24)
       
        }
        .padding(.horizontal, 16)
    }
    
}
