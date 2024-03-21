//
//  ShortMapView.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

struct ShortMapView: View {
    @State private var isMapExpanded = false
    var textOne: String
    var textTwo: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(textOne)
                    .font(.medium(size: 16))
                Image("check_mark")
            }
            Button(action: {
                isMapExpanded.toggle()
            }) {
                MiniMapView()
            }
            .sheet(isPresented: $isMapExpanded) {
                ExpandedMapView()
            }
            Regular14TextField(text: textTwo)
                .foregroundColor(.white)
             
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.Basic.gray1)
        .cornerRadius(8)
    }
}
