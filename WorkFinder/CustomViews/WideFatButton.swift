//
//  WideFatButton.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

struct WideBlueButton: View {
    @State var buttonText: String
    @Binding var buttonState: ButtonState
    
    var onPress: () -> Void

    init(buttonText: String, buttonState: Binding<ButtonState>, onPress: @escaping () -> Void) {
           self.buttonText = buttonText
           self._buttonState = buttonState
           self.onPress = onPress
       }
    var body: some View {
        Button(action: {
            if buttonState != .disabled {
                onPress()
            }
        }) {
            Text(buttonText)
                .font(.sembold(size: 16))
                .foregroundColor(textColor)

        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .background(backgroundColor)
        .cornerRadius(8)
        .disabled(buttonState == .disabled)
    }
    private var backgroundColor: Color {
        switch buttonState {
        case .normal:
            return .Special.blue
        case .disabled:
            return .Special.darkBlue
        }
    }

    private var textColor: Color {
        switch buttonState {
        case .normal:
            return .Basic.white
        case .disabled:
            return .Basic.grey4
        }
    }
}

