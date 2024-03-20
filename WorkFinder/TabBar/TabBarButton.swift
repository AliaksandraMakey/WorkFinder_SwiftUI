//
//  TabBarButton.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

public struct TabBarButton: View {
    /// text value
    let imageName: String
    let title: String
    /// flag
    let isSelected: Bool
    /// button action
    let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
           
            VStack(spacing: 2) {
                Image(imageName)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(isSelected ?  .Special.blue : .Basic.gray4)
                
                Text(title)
                    .font(.regular(size: 10))
                    .foregroundColor(isSelected ?  .Special.blue : .Basic.gray4)
            }
        }
    }
}

#Preview {
   VStack {
        TabBarButton(imageName: "star", title: "star", isSelected: true) {
            print("tap TabBarButton")
        }
        TabBarButton(imageName: "star", title: "star", isSelected: false) {
            print("tap TabBarButton")
        }
    }
}
