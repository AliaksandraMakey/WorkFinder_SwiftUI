//
//  JobSearchView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 17.03.2024.
//

import SwiftUI

struct JobSearchView: View {
    @ObservedObject var viewModel: LoginViewModel
    @Binding var isImageVisible: Bool
    @Binding var selectedOption: Int
    @State private var buttonState: ButtonState = .disabled
    @State private var showRedCircle: Bool = false
    
    var onLoginSuccess: (() -> Void)?
    var body: some View {
        VStack(alignment: .leading) {
            CustomTextWithLayerView(textLabel: ("Поиск работы"),
                                    width: 0.4, fontSize: 16)
            Spacer().frame(height: 16)
            TextField("", text: $viewModel.email)
                .foregroundColor(.white.opacity(0.4))
                .frame(height: 40)
                .background(Color.Basic.grey2)
                .cornerRadius(8)
                .multilineTextAlignment(.center)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)

                .onChange(of: viewModel.email) { newValue in
                    viewModel.email = newValue.lowercased()
                    buttonState = viewModel.email.count > 0 ? .normal : .disabled
                }
            
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(showRedCircle && (buttonState == .normal) ? Color.red : Color.clear, lineWidth: 1)
                }
                .overlay(
                    HStack {
                        if !viewModel.email.isEmpty {
                            Spacer()
                            Button(action: {
                                viewModel.clearEmail()
                            }) {
                                Image("big_close")
                                    .padding(.trailing, 10)
                            }
                        } else {
                            HStack {
                                Image("email")
                                    .foregroundColor(.gray)
                                    .opacity(isImageVisible ? 1 : 0)
                                Text("Электронная почта или телефон")
                                    .foregroundColor(.white)
                                    .opacity(isImageVisible ? 1 : 0)
                                    .padding(.leading, 0)
                            }
                        }
                    }
                )
            
                .onTapGesture {
                    isImageVisible = false
                }
            
            Spacer().frame(height: 16)
            
            SegmentedPickerButton(selectedIndex: $selectedOption, buttonState: $buttonState, onPress: {
                if viewModel.doesEmailContainSymbols {
                    showRedCircle = false
                    onLoginSuccess?()
                } else {
                    showRedCircle = true
                }
            })
            .frame(height: 40)
        }
        
        .padding(.horizontal, 16)
        
    }
}
