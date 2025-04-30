//
//   StatisticModel.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 30.04.2025.
//

import Foundation

struct StatisticModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percetageChange: Double?
    
    init(title: String, value: String, percetageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percetageChange = percetageChange
    }
    
}

let newModel = StatisticModel(title: "title", value: "value", percetageChange: nil)
let newModel2 = StatisticModel(title: "title2", value: "value2", percetageChange: 10.0)
