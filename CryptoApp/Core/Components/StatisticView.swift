//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 30.04.2025.
//
import Foundation
import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accentColor)
            
            HStack(spacing: 4){
                Image(systemName: "triangle.fill")
                    .font(.caption)
                    .rotationEffect(
                        Angle(degrees: stat.percetageChange ?? 0 >= 0 ? 0 : 180)
                    )
                
                Text(stat.percetageChange?.asPercentageString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle(stat.percetageChange ?? 0 >= 0 ? Color.theme.greenColor : Color.theme.redColor)
            .opacity(stat.percetageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.state1)
        StatisticView(stat: dev.state2)
        StatisticView(stat: dev.state3)
    }
}
