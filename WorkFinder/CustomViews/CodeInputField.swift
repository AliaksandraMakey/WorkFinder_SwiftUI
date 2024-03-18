//
//  CodeInputField.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//


import SwiftUI
import Combine

struct CodeInputField: View {
    @Binding var text: String
    @Binding var isCodeValid: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.Basic.grey2)
                .cornerRadius(8)
            TextField("", text: $text)
                .font(.medium(size: 24))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .foregroundColor(.Basic.grey3)
                .onReceive(Just(text)) { newValue in
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered != newValue {
                        text = filtered
                    }
                }
        }
    }
}
