//
//  LoginScreenView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 16.03.2024.
//


import SwiftUI
#warning ("TODO: добавить локализацию.")
struct LoginScreenView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var isImageVisible = true
    @State private var selectedOption = 0
    @State private var isCodeScreenPresented = false
    @State private var showAlert = false
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            CustomTextWithLayerView(textLabel: "Вход в личный кабинет",
                                    width: 0.5, fontSize: 22)
            .padding(.top, 64)
            .padding(.bottom, 110)
            
            JobSearchView(viewModel: viewModel, isImageVisible: $isImageVisible, selectedOption: $selectedOption, onLoginSuccess: {
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
        .fullScreenCover(isPresented: $isCodeScreenPresented) {
            CodeFieldScreenView(viewModel: viewModel)
   
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ошибка"),
                message: Text("Неверный email"),
                dismissButton: .default(Text("OK"))
            )
        }
    
        .padding(.horizontal, 16)
        .edgesIgnoringSafeArea(.all)
        .background(Color.Basic.black)
    }
}

//
//#Preview {
//    LoginScreenView(viewModel: LoginViewModel())
//}
//
