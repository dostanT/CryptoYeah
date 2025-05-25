//
//  Color.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 18.04.2025.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let greenColor = Color("GreenColor")
    let redColor = Color("RedColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    
}

struct LaunchTheme {
    let accentColor = Color("LaunchAccentColor")
    let backgroundColor = Color("LaunchBackgroundColor")
}
