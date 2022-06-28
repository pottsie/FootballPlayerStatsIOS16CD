//
//  GameFormViewModel.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import CoreData
import Foundation

final class GameFormViewModel: ObservableObject {
    
    @Published var newOpponent: String = ""
    @Published var newOurScore: Int = 0
    @Published var newOpponentScore: Int = 0
    @Published var newLengthOfGame: Int = 70
    @Published var newGameType: GameType = .club
    @Published var newDateOfGame: Date = Date()
    
    @Published var newHighlightGame: Bool = false
    @Published var newNotes: String = "Game notes."
    @Published var newMinutesPlayed: Int = 40
    
    @Published var defensiveDisruptions: Int = 0
    @Published var clearances: Int = 0
        
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
        defensiveDisruptions = Int(game.defensiveDisruptioins_)
        clearances = Int(game.clearances_)
        
        id = game.objectID
    }
    
}
