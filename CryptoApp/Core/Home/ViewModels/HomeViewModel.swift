//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 22.04.2025.
//

import Foundation


class HomeViewModel: ObservableObject{
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        })
    }
}
