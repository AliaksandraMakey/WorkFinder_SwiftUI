//
//  LoginScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//


import SwiftUI

struct LoginScreenView: View {
    //MARK: - Properties
    @ObservedObject var viewModel: LoginViewModel
    @State private var isImageVisible = true
    @State private var selectedOption = 0
    /// states
    @State private var isCodeScreenPresented = false
    @State private var showAlert = false
    //MARK: -  init
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    //MARK: - body
    var body: some View {
        VStack(alignment: .leading) {
            CustomTextWithLayerView(textLabel: "Вход в личный кабинет",
                                    width: 0.5, fontSize: 22)
            .padding(.top, 64)
            .padding(.bottom, 110)
            
            JobSearchLoginView(viewModel: viewModel, isImageVisible: $isImageVisible, selectedOption: $selectedOption, onLoginSuccess: {
                viewModel.checkEmail { success, error in
                    switch success {
                    case true:
                        isCodeScreenPresented = true
                    case false:
                        if let error = error {
                            showAlert = true
                            print("Error during login: \(error.localizedDescription)")
                        } else {
                            showAlert = true
                            print("Login failed")
                        }
                    }
                }
            })
            .frame(height: 211)
            .foregroundColor(.clear)
            .roundedRectangleFillBackgroundSystemGray()
            
            Spacer().frame(height: 56)
            
            EmployeeSearchView()
                .frame(height: 141)
                .roundedRectangleFillBackgroundSystemGray()
            
            Spacer()
        }
        // presenters
        .fullScreenCover(isPresented: $isCodeScreenPresented) {
            CodeFieldScreenView(viewModel: viewModel)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ошибка"),
                message: Text("Пользователь с таким email не найден"),
                dismissButton: .default(Text("Ввести еще раз"))
            )
        }
        .padding(.horizontal, 16)
        .edgesIgnoringSafeArea(.all)
        .background(Color.Basic.black)
    }
}
