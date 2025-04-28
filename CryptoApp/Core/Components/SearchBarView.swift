//
//  SearchBarView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 28.04.2025.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String 
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accentColor
                )
            
            TextField("Search...", text: $searchText)
                .autocorrectionDisabled(true)
                .foregroundStyle(Color.theme.accentColor)
                .overlay {
                    HStack{
                        Spacer()
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.theme.accentColor)
                            .padding()
                            .opacity(searchText.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchText = ""
                            }
                    }
                    
                }
                
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.backgroundColor)
                .shadow(
                    color: Color.theme.accentColor.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
