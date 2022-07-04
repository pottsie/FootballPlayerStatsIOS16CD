//
//  GameFormViewModel.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import CoreData
import Foundation

final class GameFormViewModel: ObservableObject {
    
    // initialize published variables for using in the game form
    @Published var newOpponent: String = ""
    @Published var newOurScore: Int = 0
    @Published var newOpponentScore: Int = 0
    @Published var newLengthOfGame: Int = 70
    @Published var newGameType: GameType = .club
    @Published var newDateOfGame: Date = Date()
    
    @Published var newHighlightGame: Bool = false
    @Published var newNotes: String = "Game notes."
    @Published var newMinutesPlayed: Int = 40
    
    @Published var newGoals: Int = 0
    @Published var newAssists: Int = 0
    @Published var newShots: Int = 0
    @Published var newShotsOnGoal: Int = 0
    
    @Published var newDribbles: Int = 0
    @Published var newTurnovers: Int = 0
    @Published var newHeadersWon: Int = 0
    @Published var newPassAttempts: Int = 0
    @Published var newPassCompletions: Int = 0
    
    @Published var newDefensiveDisruptions: Int = 0
    @Published var newClearances: Int = 0
        
    var id: NSManagedObjectID?
    
    var updating: Bool { id != nil }
    
    init() { }
    
    init(_ game: GameEntity) {
        newOpponent = game.opponent
        print(newOpponent)
        newOurScore = Int(game.ourScore_)
        newOpponentScore = Int(game.opponentScore_)
        newLengthOfGame = Int(game.lengthOfGame_)
        newGameType = game.gameType
        newDateOfGame = game.dateOfGame_!
        newHighlightGame = game.highlightGame
        newNotes = game.notes
        newMinutesPlayed = Int(game.minutesPlayed_)
        newGoals = Int(game.goals_)
        newAssists = Int(game.assists_)
        newShots = Int(game.shots_)
        newShotsOnGoal = Int(game.shotsOnGoal_)
        newDribbles = Int(game.dribbles_)
        newTurnovers = Int(game.turnovers_)
        newHeadersWon = Int(game.headersWon_)
        newPassAttempts = Int(game.passAttempts_)
        newPassCompletions = Int(game.passCompletions_)
        newDefensiveDisruptions = Int(game.defensiveDisruptions_)
        newClearances = Int(game.clearances_)
        
        id = game.objectID
    }
    
}
