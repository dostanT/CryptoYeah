//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 18.04.2025.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    @StateObject private var vm: HomeViewModel = .init()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
