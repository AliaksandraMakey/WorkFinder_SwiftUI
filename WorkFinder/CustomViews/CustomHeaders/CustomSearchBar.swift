//
//  CustomSearchBar.swift
//  WorkFinder
//
//  Created by Александра Макей on 19.03.2024.
//

import SwiftUI

public struct CustomSearchBar: View {
    /// text
    @State private var searchText = ""
    /// flag
    @State private var isSearchActive = false
    //MARK: - body
    public var body: some View {
        HStack {
            TextField("", text: $searchText)
                .padding(.leading, 40)
                .frame(height: 40)
                .background(Color.Basic.gray2)
                .foregroundColor(.Basic.white)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        if isSearchActive {
                            Image("left")
                                .padding(.leading, 10)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        isSearchActive = false
                                    }
                                }
                        } else {
                            Image("search_glass")
                                .padding(.leading, 8)
                            Text("Должность, ключевые слова")
                                .font(.regular(size: 14))
                                .foregroundColor(Color.Basic.gray4)
                        }
                        Spacer()
                    }
                )
                .onTapGesture {
                    withAnimation {
                        isSearchActive = true
                    }
                }
            
            Spacer().frame(width: 47)
            Button(action: {
                print("фильтр")
            }) {
                Image("filter")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            .frame(width: 40, height: 40)
            .background(Color.Basic.gray2)
            .cornerRadius(8)
            .padding(.leading, -40)
        }
    }
}

#Preview {
    CustomSearchBar()
}
