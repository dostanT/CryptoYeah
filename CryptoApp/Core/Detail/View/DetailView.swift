//
//  DetailView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 21.05.2025.
//
import SwiftUI

struct DetailLoadingView: View{
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack{
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        ZStack{
            Text("\(coin.name)")
        }
    }
}

struct DetailViewPreviews: PreviewProvider{
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
