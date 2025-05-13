//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 22.04.2025.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject{
    
    @Published var statistics: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    @Published var isLoading: Bool = false
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        addSubscribers()
    }
    
    //MARK: нужно понять что за хронология
    func addSubscribers() {
        //Updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        //Updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink {[weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        //Updates marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map (mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {return coins}
        
        let lowercasedText = text.lowercased()
        
        let filteredCoins = coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText)
            || coin.symbol.lowercased().contains(lowercasedText)
            || coin.id.lowercased().contains(lowercasedText)
        }
        return filteredCoins
    }
    
    private func mapAllCoinsToPortfolioCoins(coinModels: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel]{
        coinModels.compactMap { (coin) -> CoinModel? in
            guard let entity = portfolioEntities.first(where: {$0.coinID == coin.id}) else {
                return nil
            }
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percetageChange: data.marketCapChangePercentage24HUsd)
        stats.append(marketCap)
        
        let volume = StatisticModel(title: "Volume", value: data.volume)
        stats.append(volume)
        
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        stats.append(btcDominance)
        
        stats.append(volume)
        stats.append(btcDominance)
        
        
        let portfolioValue = portfolioCoins
            .map { coin -> Double in
                return coin.currentHoldingsValue
            }
            .reduce(0, +) // нужна для того что бы сложить все эллементы в массиве
        
        let previousValue = portfolioCoins
            .map { coin -> Double in
                let currnetValue = coin.currentHoldingsValue
                let percentChange = coin.priceChangePercentage24H ?? 0 / 100
                let previousValue = currnetValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
        
        let portfolio = StatisticModel(
            title: "Porfolio Value",
            value: "\(portfolioValue.asCurrencyWith2Decimals())",
            percetageChange: percentageChange
        )
        
        stats.append(portfolio)
        
        return stats
    }
}
