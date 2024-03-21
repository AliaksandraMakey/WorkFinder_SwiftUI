//
//  RoundedTextView.swift
//  WorkFinder
//
//  Created by Александра Макей on 21.03.2024.
//

import SwiftUI

struct RoundedTextView: View {
    ///text
    let text: String
    //MARK: - init
    init(text: String) {
        self.text = text
    }
    //MARK: - body
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.Basic.gray2)
            .cornerRadius(50)
    }
}
