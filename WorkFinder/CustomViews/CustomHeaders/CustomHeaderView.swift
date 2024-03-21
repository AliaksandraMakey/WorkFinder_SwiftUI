//
//  CustomHeaderView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

public struct CustomHeaderView: View {
    /// text
    var text: String
    //MARK: - body
    public var body: some View {
        HStack {
            Text(text)
                .font(.semibold(size: 20))
                .foregroundColor(Color.Basic.white)
                .padding(.leading)
            Spacer()
        }
    }
}


