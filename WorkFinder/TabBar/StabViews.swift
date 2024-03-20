//
//  StabViews.swift
//  WorkFinder
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

class ResponsesViewModel: ObservableObject {}

struct ResponsesView: View {
    @ObservedObject var viewModel = ResponsesViewModel()
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

class MessagesViewModel: ObservableObject {}

struct MessagesView: View {
    @ObservedObject var viewModel = MessagesViewModel()
    
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

class ProfileViewModel: ObservableObject {}

struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    
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

