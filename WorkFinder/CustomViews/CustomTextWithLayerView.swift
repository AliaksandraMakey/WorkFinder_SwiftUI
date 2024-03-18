//
//  CustomTextWithLayerView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct CustomTextWithLayerView: View {
    var textLabel: String
    var color: Color
    var colorContur: Color
    var width: CGFloat
    var fontSize: CGFloat
    
    init(textLabel: String,
         color: Color = Color.Basic.white,
         colorContur: Color = Color.Basic.black,
         width: CGFloat, fontSize: CGFloat) {
        self.textLabel = textLabel
        self.color = color
        self.colorContur = colorContur
        self.width = width
        self.fontSize = fontSize
    }

    var body: some View {
        Text(textLabel)
            .CustomStroke(color: colorContur, width: width)
            .font(.medium(size: fontSize))
            .foregroundColor(color)
    }
}
