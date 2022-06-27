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
    @Published var player: PlayerEntity = PlayerEntity()
    
    var isTesting: Bool = false
    let controller: DataController
    
    
    init(isTesting: Bool) {
        if isTesting {
            controller = DataController(inMemory: true)
            addMockData()
            addMockPlayerData()
        } else {
            controller = DataController(inMemory: false)
            fetchGames()
            fetchPlayerProfile()
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
    
    private func fetchPlayerProfile() {
        
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
        game2.minutesPlayed_ = 54

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
    
    private func addMockPlayerData() {
        let examplePlayer = PlayerEntity(context: controller.container.viewContext)
        examplePlayer.firstName_ = "Michael"
        examplePlayer.lastName_ = "Potts"
        examplePlayer.dateOfBirth_ = Date()
        
        player = examplePlayer
    }
    
    // MARK: - Statistic calculation functions
    
    func computeSumFor(_ stat: Constants.StatType) -> Int {
        var total = 0
        for game in games {
            switch stat {
            case .minutesPlayed:
                total += Int(game.minutesPlayed_)
            }
        }
        return total
    }
    
    func computeRecord() -> (Int, Int, Int) {
        var wins: Int = 0
        var losses: Int = 0
        var draws: Int = 0
        
        for game in games {
            if game.ourScore_ > game.opponentScore_ {
                wins += 1
            } else if game.ourScore_ < game.opponentScore_ {
                losses += 1
            } else {
                draws += 1
            }
        }
        return (wins, losses, draws)
    }
    
    func computeAvgPerGame(for stat: Constants.StatType) -> String {
        let sumOfStatValue = computeSumFor(stat)
        let averagePerGame = Double(sumOfStatValue) / Double(games.count)
        
        return averagePerGame.asAverageString()
    }
}

