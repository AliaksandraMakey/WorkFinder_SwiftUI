//
//  ImageWithTextView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

public struct ImageWithTextView: View {
    /// text
    @State var text: String
    /// image
    @State var image: String
    //MARK: - body
    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(minWidth: 270, minHeight: 270)
                    .clipped()
                    .padding(.horizontal, 16)
                
                HStack {
                    Text(text)
                        .foregroundColor(Color.Basic.white)
                        .font(.semibold(size: 20))
                        .padding(.leading, 16)
                    Spacer()
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

