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
            print("GAME DATA LOADED")
        } catch let error {
            print("Error loading game data. \(error.localizedDescription)")
        }
    }
    
    private func saveGames() {
        do {
            try controller.container.viewContext.save()
            print("GAME DATA SAVED!")
        } catch {
            print("Error saving games. \(error.localizedDescription)")
        }
    }
    
    func addGame(opponent: String, dateOfGame: Date, gameType: GameType, ourScore: Int, opponentScore: Int, lengthOfGame: Int, highlightGame: Bool, notes: String, minutesPlayed: Int) {
        let newGame = GameEntity(context: controller.container.viewContext)
        newGame.opponent_ = opponent
        newGame.dateOfGame_ = dateOfGame
        newGame.ourScore_ = Int32(ourScore)
        newGame.opponentScore_ = Int32(opponentScore)
        newGame.lengthOfGame_ = Int32(lengthOfGame)
        newGame.gameType = gameType
        newGame.highlightGame = highlightGame
        newGame.minutesPlayed_ = Int32(minutesPlayed)
        newGame.notes_ = notes

        
        saveGames()
        fetchGames()
    }
    
    func updateGame(id: NSManagedObjectID, opponent: String, dateOfGame: Date, gameType: GameType, ourScore: Int, opponentScore: Int, lengthOfGame: Int, highlightGame: Bool, notes: String, minutesPlayed: Int) {
        guard let updatedGame = games.first(where: { $0.objectID == id }) else { return }
        updatedGame.opponent_ = opponent
        print(updatedGame.opponent_ ?? "NO TEAM")
        updatedGame.dateOfGame_ = dateOfGame
        updatedGame.gameType = gameType
        updatedGame.ourScore_ = Int32(ourScore)
        updatedGame.opponentScore_ = Int32(opponentScore)
        updatedGame.lengthOfGame_ = Int32(lengthOfGame)
        updatedGame.highlightGame = highlightGame
        updatedGame.notes_ = notes
        updatedGame.minutesPlayed_ = Int32(minutesPlayed)
        
        saveGames()
        fetchGames()
    }
    
    func deleteGame(_ game: GameEntity) {
        guard let entity = games.first(where: { $0.objectID == game.objectID }) else { return }
        controller.container.viewContext.delete(entity)
        saveGames()
        fetchGames()
    }
    
    // MARK: - User Intents
    
    func toggleHighlightFlag(for game: GameEntity) {
//        let index = games.firstIndex(where: { $0.objectID == game.objectID })!
        game.highlightGame.toggle()
//        games[index].highlightGame.toggle()
        saveGames()
        fetchGames()
    }
    
    // MARK: - function that adds mock data for previews
    private func addMockData() {
        let  game1 = GameEntity(context: controller.container.viewContext)
        game1.opponent_ = "Team A"
        game1.dateOfGame_ = Date()
        game1.ourScore_ = 2
        game1.opponentScore_ = 1
        game1.lengthOfGame_ = 80
        game1.gameType_ = 0
        game1.highlightGame = true
        game1.notes_ = "This was a good game with plenty of offensive chances."
        game1.minutesPlayed_ = 65
        
        let  game2 = GameEntity(context: controller.container.viewContext)
        game2.opponent_ = "Team with a really long name that won't fit on a single line"
        game2.dateOfGame_ = Date(timeIntervalSinceNow: -1_000_000)
        game2.ourScore_ = 2
        game2.opponentScore_ = 3
        game2.lengthOfGame_ = 70
        game2.gameType_ = 1
        game2.highlightGame = false
        game1.notes_ = "Slow, boring game."
        game1.minutesPlayed_ = 54

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
