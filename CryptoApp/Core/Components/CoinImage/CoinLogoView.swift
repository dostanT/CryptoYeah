//
//  CoinLogoView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 04.05.2025.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack{
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoView(coin: dev.coin)
    }
}
