//
//  StoriesCardView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

public struct StoriesCardView: View {
    /// text value
    var buttonName: String
    var text: String
    /// image
    var image: String
    /// color
    var color: Color?
    //MARK: -  init
    init(text: String, image: String, buttonName: String = " ", color: Color? = nil) {
        self.text = text
        self.image = image
        self.buttonName = buttonName
        self.color = color
    }
    //MARK: - body
    public var body: some View {
        Grid(alignment: .leading) {
            Spacer().frame(height: 10)
            
            Image(image)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.horizontal, 8)
            
            Text(text)
                .font(.medium(size: 14))
                .padding(.horizontal, 8)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.white)
            
            Button(action: {
                print("Stories не работают")
            }, label: {
                Text(buttonName)
                    .font(.regular(size: 14))
                    .foregroundColor(color)
            })
            .padding(.horizontal, 8)
            Spacer()
        }
        .frame(width: 132, height: 120)
        .background(Color.Basic.gray2)
        .cornerRadius(8)
    }
}
