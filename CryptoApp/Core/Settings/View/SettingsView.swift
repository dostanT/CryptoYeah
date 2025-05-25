//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 24.05.2025.
//
import SwiftUI

struct SettingsView: View {
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string:"https://www.youtube.com/@doossu")!
    let telegramURL = URL(string:"https://t.me/doossu")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/dostanT")!
    @Binding var showSettingsSheet: Bool
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.theme.backgroundColor.ignoresSafeArea()
                
                //content layer
                List{
                    overview
                        .listRowBackground(Color.theme.backgroundColor)
                    coinGeckoSection
                        .listRowBackground(Color.theme.backgroundColor)
                    developerSection
                        .listRowBackground(Color.theme.backgroundColor)
                    applicationSection
                        .listRowBackground(Color.theme.backgroundColor)
                }
                .scrollContentBackground(.hidden)
                
            }
            .font(.headline)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showSettingsSheet = false
                    }label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

extension SettingsView {
    private var overview: some View {
        Section {
            VStack(alignment: .leading){
                HStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack(alignment: .leading){
                        Text("Crypto")
                        Text("Yeah")
                    }
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.theme.accentColor)
                    
                }
                Text("This app was made by folowing a Nick Sarno course on YouTube. It uses MVVM, Combine and CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding(.vertical)
            
            Link("Subscribe in YouTube", destination: youtubeURL)
                .foregroundStyle(Color.blue)
            Link("Join to my channel in Telegramm ", destination: telegramURL)
                .foregroundStyle(Color.blue)
        } header: {
            Text("Crypto Yeah")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
    }
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("It uses the CoinGecko API to get the latest prices of cryptocurrencies!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding(.vertical)
            
            Link("Visit the website", destination: coingeckoURL)
                .foregroundStyle(Color.blue)
        } header: {
            Text("Coin Gecko")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
    }
    
    private var developerSection: some View {
        Section {
            VStack(alignment: .leading){
                Image("dostanIMG")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("My name is Dostan. 18 years old. I’m a goal-oriented and curious person passionate about iOS development, always striving to build useful and scalable applications. I combine technical thinking with creativity and enjoy setting long-term goals like financial independence and growing my own projects. Outside of programming, I’m into sports, comics, and personal growth.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accentColor)
            }
            .padding(.vertical)
            Link("GitHub", destination: personalURL)
                .foregroundStyle(Color.blue)
        } header: {
            Text("About Developer")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
    }
    
    private var applicationSection: some View {
        Section {
            Link("Terms of service", destination: defaultURL)
                .foregroundStyle(Color.blue)
            Link("Privacy Policy", destination: defaultURL)
                .foregroundStyle(Color.blue)
            Link("Company Website", destination: defaultURL)
                .foregroundStyle(Color.blue)
            Link("Learn more", destination: defaultURL)
                .foregroundStyle(Color.blue)
        } header: {
            Text("Application")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSettingsSheet: .constant(true))
    }
}
