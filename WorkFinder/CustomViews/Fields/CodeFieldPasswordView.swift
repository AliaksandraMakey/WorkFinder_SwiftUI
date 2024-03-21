//
//  CodeFieldPasswordView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

public struct CodeFieldPasswordView: View {
    /// state fields
    @Binding var digits: [String]
    @FocusState private var focusedField: Int?
    /// flag
    @Binding var isCodeValid: Bool
    //MARK: - body
    public var body: some View {
        HStack(spacing: 20) {
            
            ForEach(0..<4, id: \.self) { index in
                CodeInputField(text: $digits[index], isCodeValid: $isCodeValid)
                    .frame(width: 48, height: 48)
                    .focused($focusedField, equals: index)
                
                    .onChange(of: digits[index]) { newValue in
                        // Switching focus to the following field
                        if newValue.count == 1 && index < 3 {
                            focusedField = index + 1
                        }
                        
                        // Delete digits when cleaning
                        if newValue.isEmpty {
                            digits[index] = ""
                            if index > 0 {
                                focusedField = index - 1
                            }
                        }
                        // 1 digit limit per field
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
