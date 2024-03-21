//
//  VacancyService.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import Foundation
import Alamofire

class VacancyService {
    static let shared = VacancyService()
    private let baseUrl = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
    
    /// Fetches all vacancies from the specified base URL.
    ///
    /// - Parameter completion: A closure to be executed when the request is completed, containing a Result enum with an array of VacancyModel or an Error.
    func getAllVacancies(completion: @escaping (Result<[VacancyModel], Error>) -> Void) {
        AF.request(baseUrl)
            .validate()
            .responseJSON { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let requestModel = try JSONDecoder()
                            .decode(RequestModel.self, from: data)
                        completion(.success(requestModel.vacancies))
                    } catch {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

