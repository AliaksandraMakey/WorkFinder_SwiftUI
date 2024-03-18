//
//  StabViews.swift
//  WorkFinder
//
//  Created by Александра Макей on 18.03.2024.
//

import SwiftUI

class SearchViewModel: ObservableObject {
}

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Search")
        }
    }
}


class ResponsesViewModel: ObservableObject {
}
struct ResponsesView: View {
    @ObservedObject var viewModel = ResponsesViewModel()
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Responses")
        }
    }
}
class MessagesViewModel: ObservableObject {
}
struct MessagesView: View {
    @ObservedObject var viewModel = MessagesViewModel()
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Messages")
        }
    }
}
class ProfileViewModel: ObservableObject {
}
struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationTitle("Profile")
        }
    }
}

