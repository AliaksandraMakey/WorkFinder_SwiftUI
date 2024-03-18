//
//  ImageWithTextView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct ImageWithTextView: View {
    //текстовые значения
    @State var text: String
    //картинка
    @State var image: String
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(minWidth: 270, minHeight: 270)
                    .clipped()
                    .padding(.horizontal, 16)
                
                Spacer(minLength: 30)
                
                HStack {
                    Text(text)
                        .padding(.top, 0.012 * geometry.size.height)
                        .foregroundColor(Color.Basic.white)
                        .font(.medium(size: 16))
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Spacer()
            }
            
        }
        
        .background(Color.Shadow.shadows)
        .ignoresSafeArea()
    }
}

