//
//  Regular14TextField.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

public struct Regular14TextField: View {
    /// text
    var text: String
    /// color
    var color: Color
    //MARK: -  init
    init(text: String, color: Color = .white) {
        self.text = text
        self.color = color
    }
    //MARK: - body
    public var body: some View {
        Text(text)
            .font(.regular(size: 14))
            .foregroundColor(color)
    }
}
