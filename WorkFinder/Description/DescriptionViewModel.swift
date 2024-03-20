//
//  DescriptionViewModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI


class DescriptionViewModel: ObservableObject {
    var vacancy: VacancyModel
    
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
    }
    
    func shareVacancy() {
        guard let shareURL = getShareURL() else { return }
        let activityViewController = UIActivityViewController(activityItems: [shareURL], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    private func getShareURL() -> URL? {
        return URL(string: "https://example.com")
    }
}
