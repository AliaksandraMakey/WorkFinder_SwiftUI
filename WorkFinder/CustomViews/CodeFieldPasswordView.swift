//
//  CodeFieldPasswordView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

struct CodeFieldPasswordView: View {
    @Binding var digits: [String]
    @FocusState private var focusedField: Int?
    @Binding var isCodeValid: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<4, id: \.self) { index in
                CodeInputField(text: $digits[index], isCodeValid: $isCodeValid)
                    .frame(width: 48, height: 48)
                    .focused($focusedField, equals: index)
                    .onChange(of: digits[index]) { newValue in
                        // Переключение фокуса на следующее поле
                        if newValue.count == 1 && index < 3 {
                            focusedField = index + 1
                        }
                        
                        // Удаление цифры при очистке
                        if newValue.isEmpty {
                            digits[index] = ""
                            if index > 0 {
                                focusedField = index - 1
                            }
                        }
                        // ограничение на 1 цифру в поле
                        if newValue.count > 1 {
                            digits[index] = String(newValue.suffix(1))
                        }
                        if newValue.count == 1 && index > 0 && digits[index - 1].isEmpty {
                            focusedField = index - 1
                            digits[index - 1] = newValue
                            digits[index] = ""
                        }
                    }
            }
        }
    }
}
