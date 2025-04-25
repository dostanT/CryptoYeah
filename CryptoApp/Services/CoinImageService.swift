//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 25.04.2025.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscriptions: AnyCancellable?
    private let coin: CoinModel
    
    init (coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else {return}
        imageSubscriptions = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscriptions?.cancel()
            })
    }
}
