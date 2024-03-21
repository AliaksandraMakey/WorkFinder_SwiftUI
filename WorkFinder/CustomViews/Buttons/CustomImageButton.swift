//
//  CustomImageButton.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

public struct CustomImageButton: View {
    /// button size
    var width: CGFloat
    var height: CGFloat
    /// color
    var color: Color
    /// flag
    var isOn: Bool?
    /// images
    var image: String
    var imageFill: String?
    /// button action
    var action: () -> Void
    
    //MARK: -  init
    init(image: String, width: CGFloat, height: CGFloat, isOn: Bool? = nil, imageFill: String? = nil, color: Color = .white, action: @escaping () -> Void) {
        self.image = image
        self.width = width
        self.height = height
        self.isOn = isOn
        self.imageFill = imageFill
        self.color = color
        self.action = action
    }
    //MARK: -  body
    public var body: some View {
        Button(action: action) {
            Image(isOn != nil ? (isOn! ? imageFill ?? image : image) : image)
                .resizable()
                .frame(width: width, height: height)
                .foregroundColor(color)
        }
    }
}

//#Preview {
//    VStack {
//        CustomImageButton(image: "heart", width: 28, height: 28) {
//            print("tap CustomImageButton heart")
//        }
//        CustomImageButton(image: "heart", width: 28, height: 28, isOn: true, imageFill: "fill_heart", color: .black) {
//            print("tap CustomImageButton fill_heart")
//        }
//    }
//}
