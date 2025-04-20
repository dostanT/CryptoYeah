//
//  CircleButtonView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 19.04.2025.
//
import SwiftUI



struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accentColor)
            .frame(width: 50, height: 50)
            .background{
                Circle()
                    .foregroundStyle(Color.theme.backgroundColor)
            }
            .shadow(
                color: Color.theme.accentColor.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "plus")
        .padding()
}
