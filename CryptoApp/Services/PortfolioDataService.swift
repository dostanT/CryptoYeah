//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Dostan Turlybek on 08.05.2025.
//
import Foundation
import CoreData

class PortfolioDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading persistent stores: \(error)")
            }
            self.getPortfolio()
        }
    }
    //MARK: public section
    func updatePortfolio(coin: CoinModel, amount: Double) {
        //check if coin is already in array
        if let entity = savedEntities.first(where: { savedEntity in
            return savedEntity.coinID == coin.id
        }) {
            if amount > 0 {
                update(entity: entity, newAmount: amount)
            } else {
                remove(entity: entity)
            }
        } else {
            add(coin: coin, amount: amount)
        }
    }
    
    
    //MARK: private section
    
    private func getPortfolio(){
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        
        do{
            savedEntities = try container.viewContext.fetch(request)
        } catch let error{
            print("ERROR fetching portfolio Entities: \(error)")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
        
    }
    
    private func update(entity: PortfolioEntity, newAmount: Double) {
        entity.amount = newAmount
        applyChanges()
    }
    
    private func remove(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("ERROR saving context: \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getPortfolio()
    }
}
