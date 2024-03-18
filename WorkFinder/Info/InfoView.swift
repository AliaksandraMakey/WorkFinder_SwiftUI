//
//  InfoView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct InfoView: View {
    //текстовые значения
    @State var warmingText: String
    //картинка
    @State var image: String
    //кнопка
    @State var buttonText: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer().frame(height: geometry.size.height * 0.1)
                
                ImageWithTextView(
                    text: warmingText,
                    image: image
                ).frame(width: geometry.size.width * 0.9)
                
                WideThinButton(skipButtonText: buttonText) {
                    
                }.frame(width: geometry.size.width * 0.9)
                
                Spacer()
            }
            .frame(maxHeight: geometry.size.height)
            .padding(.all, 16)
        }
    }
}

#Preview {
    InfoView(
        warmingText: "Описание",
        image: "bad_connection",
        buttonText: "Кнопка"
    )
}

