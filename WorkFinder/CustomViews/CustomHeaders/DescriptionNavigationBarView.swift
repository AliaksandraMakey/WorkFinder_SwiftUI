//
//  DescriptionNavigationBarView.swift
//  WorkFinder
//
//  Created by Александра Макей on 20.03.2024.
//

import SwiftUI

struct DescriptionNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode
    /// actions
    var action1: () -> Void
    var action2: () -> Void
    var action3: () -> Void
    //MARK: - body
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            }
            Spacer().frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 4){
                CustomImageButton(image: "open_eye", width: 26, height: 26, action: action1)
                
                CustomImageButton(image: "share", width: 26, height: 26, action: action2)
                
                CustomImageButton(image: "heart", width: 26, height: 26, isOn: true, imageFill: "fill_heart", action: action3)
            }
            .padding(.trailing)
        }
    }
}
