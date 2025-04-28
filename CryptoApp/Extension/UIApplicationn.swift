//
//  UIApplicationn.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 28.04.2025.
//
import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
