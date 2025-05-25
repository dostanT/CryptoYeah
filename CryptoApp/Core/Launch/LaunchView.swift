//
//  LaunchView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 25.05.2025.
//
import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your portfolio...".map{String($0)}
    @State private var showLoadingText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    @State private var counter: Int = 0
    
    var body: some View {
        ZStack{
            Color.launch.backgroundColor
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack{
                if showLoadingText {
                    HStack(spacing: 0){
                        ForEach(loadingText.indices, id: \.self) {index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.launch.accentColor)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear{
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring) {
                if counter + 1 == 25 {
                    counter = 0
                    loops += 1
                    if loops > 1 {
                        showLaunchView = false
                    }
                }
                else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
