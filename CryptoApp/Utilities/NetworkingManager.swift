//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 24.04.2025.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknwon
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url):
                return "Bad URL response: \(url)"
            case .unknwon:
                return "Unknwon error"
            }
        }
    }
    
    static func download(url: URL) ->  AnyPublisher<Data, any Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({try handleURLResponse(output: $0, url: url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
            break
        }
    }
}
