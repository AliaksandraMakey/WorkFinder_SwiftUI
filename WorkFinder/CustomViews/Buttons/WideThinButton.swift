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
    /// button action
    var onPress: () -> Void
    //MARK: -  init
    init(name: String, onPress: @escaping () -> Void) {
        self.name = name
        self.onPress = onPress
    }
    //MARK: -  body
    public var body: some View {
        Button(action: onPress) {
            Text(name)
                .font(.regular(size: 14))
                .foregroundColor(Color.Basic.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 32)
        .background(Color.Special.green)
        .cornerRadius(50)
    }
}
//#Preview {
//    WideThinButton(name: "tap") {
//        print("tab  WideGreenButton")
//    }
//}
