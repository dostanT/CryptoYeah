//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 25.04.2025.
//

import SwiftUI
import Foundation
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = .init(coin: coin)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self](_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
