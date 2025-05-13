//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 14.05.2025.
//
import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
    
}
