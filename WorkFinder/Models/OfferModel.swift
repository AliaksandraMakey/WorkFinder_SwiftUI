//
//  OfferModel.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

struct OfferModel: Codable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonModel?
}
