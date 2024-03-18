//
//  CodeFieldScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

#warning ("TODO: Вынести все Error и обработать ошибки, добавить текста кастомные, добавить на вводе кода звездочки")
struct CodeFieldScreenView: View {
    // модель
    @State var viewModel: LoginViewModel
    var currentUser = UserModel(email: "", password: "")
    @State private var digits = Array(repeating: "", count: 4)
    @State private var buttonState: ButtonState = .disabled
    // отслеживания состояния
    @State private var showTriedLimitWarningAlert = false
    @State private var shouldShowTabBarView = false

    
    var body: some View {
        VStack {

            ScrollView {
                Spacer().frame(height: 160)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Отправили код на \(viewModel.email)")
                        .foregroundColor(.white)
                        .font(.sembold(size: 20))
                    
                    Text("Напишите его, чтобы подтвердить, что это \nвы, а не кто-то другой входит в личный  \nкабинет")
                        .foregroundColor(.white)
                        .font(.medium(size: 16))
                }
                    CodeFieldPasswordView(digits: $digits, isCodeValid: $viewModel.isEmailValid)
                    
                    WideBlueButton(buttonText: "Подтвердить", buttonState: $buttonState) {
                        handleWideBlueButtonTap()
                    }
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
        
        .alert(isPresented: $showTriedLimitWarningAlert) {
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
    private func handleWideBlueButtonTap() {
        let enteredCode = digits.joined()
        if enteredCode.count == 4 {
            viewModel.password = enteredCode
            viewModel.checkPassword { success, error in
                switch (success, error) {
                case (true, nil):
                    viewModel.createUser { user, error in
                        if let user = user {
                        self.currentUser.email = user.email
                        self.currentUser.password = user.password
                            shouldShowTabBarView = true
                        } else if let error = error {
                            print("Error creating user: \(error.localizedDescription)")
                            showTriedLimitWarningAlert = true
                        }
                    }
                case (false, let error?):
                    print("Error during password check: \(error.localizedDescription)")
                    showTriedLimitWarningAlert = true
                default:
                    print("Password check failed")
                    showTriedLimitWarningAlert = true
                }
            }
        }
    }
}


#Preview {
    CodeFieldScreenView(viewModel: LoginViewModel(), currentUser: UserModel(email: "example@mail.ru", password: "1111"))
}
