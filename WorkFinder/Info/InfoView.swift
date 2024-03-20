//
//  InfoView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct InfoView: View {
    /// text
    var warmingText: String
    /// image
    @State var image: String
    /// button name
    @State var buttonName: String
    /// flag
    @State private var isContentViewPresented = false
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer().frame(height: geometry.size.height * 0.1)
                
                ImageWithTextView(
                    text: warmingText,
                    image: image
                ).frame(width: geometry.size.width * 0.9)
                
                WideThinButton(name: buttonName) {
                    self.isContentViewPresented = true
                }
                .padding(.horizontal, 16)
                
                Spacer().frame(width: geometry.size.width * 0.9)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.Basic.black)
        .fullScreenCover(isPresented: $isContentViewPresented) {
            ContentView()
        }
    }
}

#Preview {
    InfoView(
        warmingText: "Описание",
        image: "bad_connection",
        buttonName: "Кнопка"
    )
}

