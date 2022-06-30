//
//  MockedDataController.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/28/22.
//

import CoreData
import Foundation

final class MockedDataController: GameDataControllerProtocol {
    
    var mockedGameData: [GameEntity] = []
    var mockedPlayerProfile: PlayerEntity = PlayerEntity()
    
    var container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "FootballStatsModel")
        container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading persistent stores. \(error.localizedDescription)")
            }
        }
        loadMockData()
        loadMockPlayerProfile()
    }
    
    private func loadMockPlayerProfile() {
        let examplePlayer = PlayerEntity(context: container.viewContext)
        examplePlayer.firstName_ = "Michael"
        examplePlayer.lastName_ = "Potts"
        examplePlayer.dateOfBirth_ = Date()
        
        do {
            try container.viewContext.save()
        } catch {
            print("Error saving mock data. \(error.localizedDescription)")
        }
    }
    
    private func loadMockData() {
        
        let  game1 = GameEntity(context: container.viewContext)
        game1.opponent_ = "Team A"
        game1.dateOfGame_ = Date()
        game1.ourScore_ = 4
        game1.opponentScore_ = 1
        game1.lengthOfGame_ = 80
        game1.gameType_ = 0
        game1.highlightGame = true
        game1.notes_ = "This was a good game with plenty of offensive chances."
        game1.minutesPlayed_ = 65
        game1.goals_ = 1
        game1.assists_ = 1
        game1.shots_ = 3
        game1.shotsOnGoal_ = 1
        game1.defensiveDisruptions_ = 3
        game1.clearances_ = 2
        game1.dribbles_ = 4
        game1.turnovers_ = 1
        game1.headersWon_ = 2
        game1.passAttempts_ = 14
        game1.passCompletions_ = 12
        
        let  game2 = GameEntity(context: container.viewContext)
        game2.opponent_ = "Team with a really long name that won't fit on a single line"
        game2.dateOfGame_ = Date(timeIntervalSinceNow: -1_000_000)
        game2.ourScore_ = 2
        game2.opponentScore_ = 3
        game2.lengthOfGame_ = 70
        game2.gameType_ = 1
        game2.highlightGame = false
        game2.notes_ = "Slow, boring game."
        game2.minutesPlayed_ = 54
        game2.goals_ = 0
        game2.assists_ = 1
        game2.shots_ = 1
        game2.shotsOnGoal_ = 0
        game2.defensiveDisruptions_ = 3
        game2.clearances_ = 2
        game2.dribbles_ = 2
        game2.turnovers_ = 0
        game2.headersWon_ = 2
        game2.passAttempts_ = 16
        game2.passCompletions_ = 13

        let  game3 = GameEntity(context: container.viewContext)
        game3.opponent_ = nil
        game3.dateOfGame_ = Date(timeIntervalSinceNow: -2_000_000)
        game3.ourScore_ = 1
        game3.opponentScore_ = 1
        game3.lengthOfGame_ = 80
        game3.gameType_ = 1
        game3.highlightGame = false
        game3.notes_ = "Good battle the entire game"
        game3.minutesPlayed_ = 74
        game3.goals_ = 1
        game3.assists_ = 0
        game3.shots_ = 4
        game3.shotsOnGoal_ = 2
        game3.defensiveDisruptions_ = 3
        game3.clearances_ = 2
        game3.dribbles_ = 4
        game3.turnovers_ = 1
        game3.headersWon_ = 3
        game3.passAttempts_ = 18
        game3.passCompletions_ = 16

        do {
            try container.viewContext.save()
        } catch {
            print("Error saving mock data. \(error.localizedDescription)")
        }

    }
    
    func fetchGames() -> [GameEntity] {
                
        let request = NSFetchRequest<GameEntity>(entityName: "GameEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "dateOfGame_", ascending: false)]

        do {
            mockedGameData = try container.viewContext.fetch(request)
            return mockedGameData
        } catch let error {
            print("Error loading game data. \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteGame(_ game: GameEntity) {
        container.viewContext.delete(game)
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
    
    func fetchPlayerProfile() -> PlayerEntity {
                
        let request = NSFetchRequest<PlayerEntity>(entityName: "PlayerEntity")

        do {
            mockedPlayerProfile = try container.viewContext.fetch(request).first!
            return mockedPlayerProfile
        } catch let error {
            print("Error loading game data. \(error.localizedDescription)")
            return mockedPlayerProfile
        }
    }
}
