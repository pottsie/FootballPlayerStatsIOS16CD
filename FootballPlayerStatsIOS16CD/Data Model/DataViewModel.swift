//
//  DataViewModel.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/28/22.
//

import CoreData
import Foundation

final class DataViewModel: ObservableObject {
    
    @Published var games: [GameEntity] = []
    
    var dataController: GameDataControllerProtocol
    
    init(controller: GameDataControllerProtocol) {
        
        dataController = controller
        
        fetchGames()
    }
    
    private func fetchGames() {
        games = dataController.fetchGames()
    }
    

    private func saveGames() {
        dataController.saveGames()
    }
    
    // MARK: - User Intents
    
    func deleteGame(_ game: GameEntity) {
        guard let entity = games.first(where: { $0.objectID == game.objectID }) else { return }
        dataController.deleteGame(entity)
        saveGames()
        fetchGames()
    }

    func addGame(opponent: String, dateOfGame: Date, gameType: GameType, ourScore: Int, opponentScore: Int, lengthOfGame: Int, highlightGame: Bool, notes: String, minutesPlayed: Int, defensiveDisruptions: Int, clearances: Int) {
        
        let newGame = dataController.addGame()
        newGame.opponent_ = opponent
        newGame.dateOfGame_ = dateOfGame
        newGame.ourScore_ = Int32(ourScore)
        newGame.opponentScore_ = Int32(opponentScore)
        newGame.lengthOfGame_ = Int32(lengthOfGame)
        newGame.gameType = gameType
        newGame.highlightGame = highlightGame
        newGame.minutesPlayed_ = Int32(minutesPlayed)
        newGame.notes_ = notes
        newGame.defensiveDisruptioins_ = Int32(defensiveDisruptions)
        newGame.clearances_ = Int32(clearances)
        
        saveGames()
        fetchGames()
    }
    
    func updateGame(id: NSManagedObjectID, opponent: String, dateOfGame: Date, gameType: GameType, ourScore: Int, opponentScore: Int, lengthOfGame: Int, highlightGame: Bool, notes: String, minutesPlayed: Int, defensiveDisruptions: Int, clearances: Int) {
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
        updatedGame.defensiveDisruptioins_ = Int32(defensiveDisruptions)
        updatedGame.clearances_ = Int32(clearances)
        
        saveGames()
        fetchGames()
    }

    
    func toggleHighlightFlag(for game: GameEntity) {
        game.highlightGame.toggle()
        saveGames()
        fetchGames()
    }
    
    // MARK: - function that adds mock data for previews
    
//    private func addMockPlayerData() {
//        let examplePlayer = PlayerEntity(context: controller.container.viewContext)
//        examplePlayer.firstName_ = "Michael"
//        examplePlayer.lastName_ = "Potts"
//        examplePlayer.dateOfBirth_ = Date()
//
//        player = examplePlayer
//    }
    
    // MARK: - Statistic calculation functions
    
    func computeSumFor(_ stat: Constants.StatType) -> Int {
        var total = 0
        for game in games {
            switch stat {
            case .minutesPlayed:
                total += Int(game.minutesPlayed_)
            case .goalsFor:
                total += Int(game.ourScore_)
            case .goalsAgainst:
                total += Int(game.opponentScore_)
            case .defensiveDisruptions:
                total += Int(game.defensiveDisruptioins_)
            case .clearances:
                total += Int(game.clearances_)
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
