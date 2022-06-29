//
//  ProductionDataController.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/28/22.
//

import CoreData
import Foundation

final class ProductionDataController: GameDataControllerProtocol {
    
    var gameData: [GameEntity] = []
    var container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "FootballStatsModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading persistent stores. \(error.localizedDescription)")
            }
        }
    }
    
    func fetchPlayerProfile() -> PlayerEntity {
        return PlayerEntity()
    }

    func fetchGames() -> [GameEntity] {
        let request = NSFetchRequest<GameEntity>(entityName: "GameEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "dateOfGame_", ascending: false)]

        do {
            gameData = try container.viewContext.fetch(request)
            return gameData
        } catch let error {
            print("Error loading game data. \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteGame(_ game: GameEntity) {
        //
    }
    
    func addGame() -> GameEntity {
        GameEntity(context: container.viewContext)
    }
    
    func updateGame() {
        //
    }
    
    func saveGames() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving game data. \(error.localizedDescription)")
        }
    }
}
