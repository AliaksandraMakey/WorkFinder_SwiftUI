//
//  StabViews.swift
//  WorkFinder
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

//MARK: - ResponsesViewModel
class ResponsesViewModel: ObservableObject {}

//MARK: - ResponsesView
struct ResponsesView: View {
    //MARK: - Properties
    @ObservedObject var viewModel = ResponsesViewModel()
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer() .frame(height: geometry.size.height * 0.07)
                CustomHeaderView(text: "Отклики")
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.Basic.black)
        }
    }
}

//MARK: - MessagesViewModel
class MessagesViewModel: ObservableObject {}

//MARK: - MessagesView
struct MessagesView: View {
    //MARK: - Properties
    @ObservedObject var viewModel = MessagesViewModel()
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer() .frame(height: geometry.size.height * 0.07)
                CustomHeaderView(text: "Сообщения")
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.Basic.black)
        }
    }
}

//MARK: - ProfileViewModel
class ProfileViewModel: ObservableObject {}

//MARK: - ProfileView
struct ProfileView: View {
    //MARK: - Properties
    @ObservedObject var viewModel = ProfileViewModel()
    //MARK: - body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer() .frame(height: geometry.size.height * 0.07)
                CustomHeaderView(text: "Профиль")
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .edgesIgnoringSafeArea(.all)
            .background(Color.Basic.black)
        }
    }
}

