//
//  WideFatButton.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI
 /// text
/// flag
/// button action
public struct WideBlueButton: View {
    /// text
    var name: String
    /// states
    @Binding var buttonState: ButtonState
    /// button action
    var onPress: () -> Void
    //MARK: -  init
    init(name: String, buttonState: Binding<ButtonState>, onPress: @escaping () -> Void) {
           self.name = name
           self._buttonState = buttonState
           self.onPress = onPress
       }
    //MARK: - body
    public var body: some View {
        Button(action: {
            if buttonState != .disabled {
                onPress()
            }
        }) {
            Text(name)
                .font(.semibold(size: 16))
                .foregroundColor(textColor)

        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .background(backgroundColor)
        .cornerRadius(8)
        .disabled(buttonState == .disabled)
    }
    //MARK: - Properties
    /// Property that defines the background color of the button based on its state.
    private var backgroundColor: Color {
        switch buttonState {
        case .normal:
            return .Special.blue
        case .disabled:
            return .Special.darkBlue
        }
    }
    /// Property that defines the text color on the button based on its state.
    private var textColor: Color {
        switch buttonState {
        case .normal:
            return .Basic.white
        case .disabled:
            return .Basic.gray4
        }
    }
}
#Preview {
    WideBlueButton(name: "tap", buttonState: .constant(.normal)) {
        print("tab  WideBlueButton")
    }
}
