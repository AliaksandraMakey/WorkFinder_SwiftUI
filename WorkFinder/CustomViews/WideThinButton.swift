//
//  WideThinButton.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct WideThinButton: View {
    @State var skipButtonText: String
    var onSkipPress: () -> Void
    
    var body: some View {
        Button(action: onSkipPress) {
            Text(skipButtonText)
                .font(.regular(size: 14))
                .foregroundColor(Color.Basic.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 32)
        .background(Color.Special.green)
        .cornerRadius(50)

    }
}
#Preview {
    WideThinButton(skipButtonText: "tap") {
        print("tab  WideGreenButton")
    }
}
