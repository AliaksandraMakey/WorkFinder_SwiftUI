//
//  WideThinButton.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

public struct WideThinButton: View {
    /// text
    var name: String
    /// color
    var color: Color
    /// radius
    var radius: CGFloat
    /// button action
    var onPress: () -> Void
    //MARK: -  init
    init(name: String, color: Color = Color.Special.green, radius: CGFloat = 50, onPress: @escaping () -> Void) {
        self.name = name
        self.color = color
        self.radius = radius
        self.onPress = onPress
    }

    //MARK: -  body
    public var body: some View {
        Button(action: onPress) {
            Text(name)
                .font(.regular(size: 14))
                .foregroundColor(Color.Basic.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(color)
        .cornerRadius(radius)
    }
}
//#Preview {
//    WideThinButton(name: "tap") {
//        print("tab  WideGreenButton")
//    }
//}
