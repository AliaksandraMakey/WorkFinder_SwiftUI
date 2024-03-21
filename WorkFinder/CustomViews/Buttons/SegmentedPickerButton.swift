//
//  SegmentedPickerButton.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct SegmentedPickerButton: View {
    /// states
    @Binding var selectedIndex: Int
    @Binding var buttonState: ButtonState
    /// button action
    var onPress: () -> Void
    //MARK: -  init
    init(selectedIndex: Binding<Int>, buttonState: Binding<ButtonState> , onPress: @escaping () -> Void) {
        self._buttonState = buttonState
        self._selectedIndex = selectedIndex
        self.onPress = onPress
    }
    #warning("TODO: - при необходимости переиспользовать компонент вынести за кнопку TitleOption")
    enum TitleOption: String, CaseIterable {
        case one = "Продолжить"
        case two = "Войти с паролем"
    }
    // MARK: - body
    var body: some View {
        GeometryReader { geometry in
            HStack {
                HStack {
                    Button(action: {
                        if buttonState != .disabled {
                            onPress()
                        }
                        selectedIndex = 0
                    }) {
                        Text(TitleOption.one.rawValue)
                            .font(.regular(size: 14))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .foregroundColor(selectedIndex == 0 ? .Basic.white : .Special.darkBlue)
                    }
                }
                .frame(width: selectedIndex == 0 ? geometry.size.width / 2 : nil)
                .background(getBackgroundColor(forIndex: 0))
                .cornerRadius(8)
                .frame(maxHeight: .infinity)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                
                Button(action: {
                    if buttonState != .disabled {
                        onPress()
                    }
                    selectedIndex = 1
                }) {
                    Text(TitleOption.two.rawValue)
                        .font(.regular(size: 14))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .foregroundColor(selectedIndex == 1 ? .Basic.white : .Special.darkBlue)
                }
                    .frame(width: selectedIndex == 1 ? geometry.size.width / 2 : nil)
                    .background(selectedIndex == 1 ? .Special.blue : Color.clear)
                    .cornerRadius(8)
                    .frame(maxHeight: .infinity)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
                    .disabled(buttonState == .disabled)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 44)
    }
    //MARK: - Metods
    /// Method that determines the background color for a specific index based on the button state.
    func getBackgroundColor(forIndex index: Int) -> Color {
        switch buttonState {
        case .normal:
            return selectedIndex == index ? .Special.blue : .clear
        case .disabled:
            return .Special.darkBlue
        }
    }
}

//#Preview {
//    SegmentedPickerButton(selectedIndex: .constant(0), buttonState: .constant(.normal)) {
//        print("tab  SegmentedPickerButton")
//    }
//}
