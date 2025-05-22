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
    
    @StateObject var vm: DetailViewModel
    let coin: CoinModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        self.coin = coin
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        Text("Hello")
    }
}

struct DetailViewPreviews: PreviewProvider{
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
