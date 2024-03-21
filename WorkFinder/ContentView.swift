//
//  ContentView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 15.03.2024.
//

import Alamofire
import SwiftUI
import RealmSwift

struct ContentView: View {
#warning ("TODO: Вынести все Error и обработать ошибки. Вынести текстовые значения в отдельную сущность и добавить локализацию.")
    //MARK: - Properties
    @State private var hasInternetConnection = true
    @State var mistake = InfoProperties.noNetwork
    //MARK: -  body
    var body: some View {
        VStack {
            if hasInternetConnection {
                TabBarView(user: UserModel(id: "", email: "", password: ""))
            } else {
                InfoView(warmingText: mistake.warmingText, 
                         image: mistake.image,
                         buttonName: mistake.buttonName)
            }
        }
        .onAppear(perform: checkInternetConnection)
    }
    
    private func checkInternetConnection() {
        NetworkReachabilityManager.default?.startListening { status in
            DispatchQueue.main.async {
                hasInternetConnection = status == .reachable(.ethernetOrWiFi) || status == .reachable(.cellular)
            }
        }
    }
}

#Preview {
    ContentView()
}


