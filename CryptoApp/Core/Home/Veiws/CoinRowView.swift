//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 21.04.2025.
//
import SwiftUI


struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
            
        }
        .font(.subheadline)
        .background(Color.theme.backgroundColor)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accentColor)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accentColor)
    }
    private var rightColumn: some View {
        VStack (alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .foregroundStyle(Color.theme.accentColor)
                .bold()
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundStyle(
                    coin.priceChangePercentage24H ?? 0 >= 0
                    ? Color.theme.greenColor
                    : Color.theme.redColor
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
