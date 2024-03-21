//
//  GreenStackTextWithImageView.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

struct GreenStackTextWithImageView: View {
    /// text
    var text: String
    /// image
    var imageName: String
    //MARK: -  init
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            HStack {
                HStack {
                    Text(text)
                        .foregroundColor(.white)
                        .font(.regular(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                  
                }
                .padding(.leading, 8)
                
                Spacer()
                HStack(alignment: .top) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                }
                .padding(.top, -12)
                .padding(.trailing, 8)
            }
            .frame(height: 50)
            .frame(width: geometry.size.width)
            .background(Color.Special.darkGreen)
            .cornerRadius(8)
        }
    }
}


#Preview {
    GreenStackTextWithImageView(text: "147 человек уже откликнулись", imageName: "star")
}
