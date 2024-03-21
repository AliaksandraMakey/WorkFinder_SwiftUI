//
//  CodeFieldScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

#warning ("FIXME: добавить на вводе кода звездочки")
struct CodeFieldScreenView: View {
    //MARK: - Properties
    var currentUser = UserModel.shared
    @State var viewModel: LoginViewModel
    @State private var digits = Array(repeating: "", count: 4)
    @State private var buttonState: ButtonState = .disabled
    /// states
    @State private var showWarningAlert = false
    @State private var shouldShowTabBarView = false
    //MARK: -  body
    var body: some View {
        VStack {
            // scroll view
            ScrollView {
                Spacer().frame(height: 160)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Отправили код на \(viewModel.email)")
                        .foregroundColor(.white)
                        .font(.semibold(size: 20))
                    Text("Напишите его, чтобы подтвердить, что это \nвы, а не кто-то другой входит в личный  \nкабинет")
                        .foregroundColor(.white)
                        .font(.medium(size: 16))
                }
                CodeFieldPasswordView(digits: $digits, isCodeValid: $viewModel.isEmailValid)
                
                WideBlueButton(name: "Подтвердить", buttonState: $buttonState) {
                    handleWideBlueButtonTap()
                }
                .padding(.horizontal, 16)
                .onChange(of: digits) { newValue in
                    if newValue.allSatisfy({ !$0.isEmpty }) {
                        buttonState = .normal
                    } else {
                        buttonState = .disabled
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.Basic.black)
        // presenters
        .alert(isPresented: $showWarningAlert) {
            Alert(
                title: Text("Ошибка авторизации"),
                message: Text("Код не верный"),
                dismissButton: .default(Text("OK"))
            )
        }
        .fullScreenCover(isPresented: $shouldShowTabBarView) {
            TabBarView(viewModel: viewModel, user: currentUser)
        }
    }
    /// Handles the tap action on the wide blue button.
    ///
    /// Checks the entered code for 4 digits and, if the condition is met, sets the password in ViewModel and checks its correctness asynchronously. After checking, it displays either a tab bar or an error warning
    private func handleWideBlueButtonTap() {
        let enteredCode = digits.joined()
        if enteredCode.count == 4 {
            viewModel.password = enteredCode
            viewModel
                .checkPassword { success, error in
                    switch (success, error) {
                    case (true, nil):
                        shouldShowTabBarView = true
                    case (false, let error?):
                        print("Error during password check: \(error.localizedDescription)")
                        showWarningAlert = true
                    default:
                        print("Password check failed")
                        showWarningAlert = true
                    }
                }
        }
    }
}
