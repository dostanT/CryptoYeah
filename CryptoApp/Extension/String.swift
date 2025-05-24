//
//  String.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 24.05.2025.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(
            of: "<[^>]+>",
            with: "",
            options: .regularExpression,
            range: nil)
    }
}
