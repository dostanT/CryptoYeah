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
    
    //изменяет цвет navigation title (Круто!!!!!)
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
    }
    
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
