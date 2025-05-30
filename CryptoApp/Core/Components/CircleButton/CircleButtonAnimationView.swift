//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 19.04.2025.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
            .onAppear {
                animate = false
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
