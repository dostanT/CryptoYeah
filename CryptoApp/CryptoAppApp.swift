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
    @State private var showLaunchView: Bool = true
    
    //изменяет цвет navigation title (Круто!!!!!)
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accentColor)
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                NavigationStack{
                    HomeView()
                        .navigationBarHidden(true)
                }
                .environmentObject(vm)
                ZStack{
                    if showLaunchView{
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
