//
//  GameDataModel.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import CoreData
import Foundation

final class GameDataModel: ObservableObject {
    
    @Published var games: [GameEntity] = []
    var isTesting: Bool = false
    let controller: DataController
    
    
    init(isTesting: Bool) {
        if isTesting {
            controller = DataController(inMemory: true)
            addMockData()
        } else {
            controller = DataController(inMemory: false)
            fetchGames()
        }
    }
    
    private func fetchGames() {
        let request = NSFetchRequest<GameEntity>(entityName: "GameEntity")
        // sort games from newest to oldest
        request.sortDescriptors = [NSSortDescriptor(key: "dateOfGame_", ascending: false)]

        do {
            games = try controller.container.viewContext.fetch(request)
        } catch let error {
            print("Error loading game data. \(error.localizedDescription)")
        }
    }
    
    private func saveGames() {
        do {
            try controller.container.viewContext.save()
        } catch {
            print("Error saving games. \(error.localizedDescription)")
        }
    }
    
    func addGame() {
        
    }
    
    func deleteGame() {
        
    }
    
    // MARK: - function that adds mock data for testing
    private func addMockData() {
        let  game1 = GameEntity(context: controller.container.viewContext)
        game1.opponent_ = "Team A"
        game1.dateOfGame_ = Date()
        game1.ourScore_ = 2
        game1.opponentScore_ = 1
        game1.gameType_ = 0
        game1.highlightGame = true
        
        let  game2 = GameEntity(context: controller.container.viewContext)
        game2.opponent_ = "Team with a really long name that won't fit on a single line"
        game2.dateOfGame_ = Date(timeIntervalSinceNow: -1_000_000)
        game2.ourScore_ = 2
        game2.opponentScore_ = 3
        game2.gameType_ = 1
        game2.highlightGame = false

        do {
            try controller.container.viewContext.save()
        } catch {
            print("Error saving mock data. \(error.localizedDescription)")
        }
        
        let request = NSFetchRequest<GameEntity>(entityName: "GameEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "dateOfGame_", ascending: false)]

        do {
            games = try controller.container.viewContext.fetch(request)
        } catch let error {
            print("Error loading game data. \(error.localizedDescription)")
        }

    }
}
