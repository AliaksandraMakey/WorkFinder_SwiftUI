//
//  MainStoriesHeaderView.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

struct MainStoriesHeaderView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(MainStoriesProperties.allCases, id: \.self) { property in
                    if let buttonName = property.buttomName {
                        StoriesCardView(text: property.text, image: property.imageName, buttonName: buttonName)
                    } else {
                        StoriesCardView(text: property.text, image: property.imageName)
                    }
                }
                .padding(.horizontal, 0)
            }
         
        
            .padding(.bottom)
        }
        .padding(.leading, 16)
    }
}

