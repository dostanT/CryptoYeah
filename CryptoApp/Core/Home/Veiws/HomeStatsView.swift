//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 30.04.2025.
//
import SwiftUI


struct HomeStatsView: View{
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View{
        HStack {
            if showPortfolio {
                ForEach(vm.statistics[0..<vm.statistics.count/2]) {stat in
                    StatisticView(stat: stat)
                        .frame(width: UIScreen.main.bounds.width / 3)
                }
                .transition(.move(edge: .leading))
                
            }
            else {
                ForEach(vm.statistics[vm.statistics.count/2..<vm.statistics.count]) {stat in
                    StatisticView(stat: stat)
                        .frame(width: UIScreen.main.bounds.width / 3)
                }
                .transition(.move(edge: .trailing))
            }
        }
        
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(true))
            .environmentObject(dev.homeVM)
    }
}

