//
//  ProtfolioView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 04.05.2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolioView: Bool
    @State private var selectedCoin: CoinModel? = nil
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $vm.searchText)
                    
                    ScrollView(.horizontal, showsIndicators: true){
                        LazyHStack(spacing: 10){
                            ForEach(vm.allCoins){coin in
                                CoinLogoView(coin: coin)
                                    .frame(width: 75)
                                    .padding()
                                    .onTapGesture{
                                        withAnimation(.easeIn){
                                            selectedCoin = coin
                                        }
                                    }
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                selectedCoin?.id == coin.id ? Color.theme.greenColor : Color.clear
                                                , lineWidth: 1.0)
                                    )
                            }
                        }
                        .padding(.vertical,4)
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle("Edit Protfolio")
            .toolbar {
                ToolbarItem(placement:.topBarLeading) {
                    Button{
                        showPortfolioView = false
                    }label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}


struct ProtfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(showPortfolioView: .constant(true))
            .environmentObject(HomeViewModel())
    }
}

extension Porto
