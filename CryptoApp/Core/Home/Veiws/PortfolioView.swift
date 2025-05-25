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
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoView
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .background(Color.theme.backgroundColor.ignoresSafeArea())
            
            .navigationTitle("Edit Protfolio")
            .toolbar {
                ToolbarItem(placement:.topBarLeading) {
                    Button{
                        showPortfolioView = false
                    }label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement:.topBarTrailing) {
                    trailingNavBarButtons
                }
            }
            .onChange(of: vm.searchText) { oldValue, newValue in
                if newValue.isEmpty{
                    removeSelectedCoin()
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

extension PortfolioView{
    private var coinLogoView: some View{
        ScrollView(.horizontal, showsIndicators: true){
            LazyHStack(spacing: 10){
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins){coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding()
                        .onTapGesture{
                            withAnimation(.easeIn){
                                updateSelectedCoin(coin: coin)
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
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }) {
            if let amount = portfolioCoin.currentHoldings {
                quantityText = "\(amount)"
            } else {
                quantityText = ""
            }
        }
    }
    
    private func getCurrentValue() -> Double{
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View{
        VStack(spacing: 20){
            HStack{
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? "")")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            
            Divider()
            
            HStack{
                Text("Amount holding: ")
                Spacer()
                TextField("Ex: 20.3", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            
            HStack{
                Text("Current value: ")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none) { i in
            return i
        }
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButtons: some View {
        HStack{
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            
            
            Button{
                saveButtonPressed()
            }label: {
                Text("Save")
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0
            )
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else { return }
        
        //save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        //show checkmark
        withAnimation (.easeIn){
            showCheckmark = true
            removeSelectedCoin()
        }
        
        //hide the keyboard
        UIApplication.shared.endEditing()
        
        //hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            withAnimation(.easeOut(duration: 2.0)){
                showCheckmark = false
            }
        })
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}
