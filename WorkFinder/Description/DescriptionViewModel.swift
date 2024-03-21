//
//  DescriptionViewModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

class DescriptionViewModel: ObservableObject {
    // MARK: - Properties
    var vacancy: VacancyModel
    // MARK: - init
    init(vacancy: VacancyModel) {
        self.vacancy = vacancy
    }
    // MARK: - Methods
    /// Shares the vacancy by presenting a UIActivityViewController with the share URL.
    func shareVacancy() {
        guard let shareURL = getShareURL() else { return }
        let activityViewController = UIActivityViewController(activityItems: [shareURL], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    /// Retrieves the share URL for the vacancy.
    private func getShareURL() -> URL? {
        return URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14")
    }
}
