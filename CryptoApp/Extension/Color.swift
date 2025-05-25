//
//  Color.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 18.04.2025.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme2()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let greenColor = Color("GreenColor")
    let redColor = Color("RedColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    
}

struct ColorTheme2 {
    let accentColor = Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
    let backgroundColor = Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))
    let greenColor = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
    let redColor = Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1))
    let secondaryTextColor = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
}

struct LaunchTheme {
    let accentColor = Color("LaunchAccentColor")
    let backgroundColor = Color("LaunchBackgroundColor")
}
