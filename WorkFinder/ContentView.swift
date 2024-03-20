//
//  ContentView.swift
//  WorkFinder_SwiftUI
//
//  Created by Александра Макей on 15.03.2024.
//

import Alamofire
import SwiftUI

struct ContentView: View {
    @State private var hasInternetConnection = true
    @State var mistake = InfoProperties.noNetwork
    var body: some View {
        VStack {
            if hasInternetConnection {
                TabBarView()
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


