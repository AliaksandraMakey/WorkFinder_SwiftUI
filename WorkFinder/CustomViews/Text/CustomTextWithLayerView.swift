//
//  CustomTextWithLayerView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

public struct CustomTextWithLayerView: View {
    /// text
    var textLabel: String
    /// color
    var color: Color
    var colorContur: Color
    /// sizes
    var width: CGFloat
    var fontSize: CGFloat
    //MARK: -  init
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
    //MARK: -  body
    public var body: some View {
        Text(textLabel)
            .customStroke(color: colorContur, width: width)
            .font(.medium(size: fontSize))
            .foregroundColor(color)
    }
}
