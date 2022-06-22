//
//  GameFormViewModel.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import Foundation

final class GameFormViewModel: ObservableObject {
    
    @Published var newOpponent: String = ""
    @Published var newOurScore: Int = 0
    @Published var newOpponentScore: Int = 0
    @Published var newLengthOfGame: Int = 40
    @Published var newGameType: GameType = .club
    @Published var newDateOfGame: Date = Date()
    
    @Published var isUpdating: Bool = false
    
    init() { }
    
    init(_ game: GameEntity) {
        newOpponent = game.opponent
        newOurScore = Int(game.ourScore_)
        newOpponentScore = Int(game.opponentScore_)
        newLengthOfGame = Int(game.lengthOfGame_)
        newGameType = game.gameType
        newDateOfGame = game.dateOfGame_!
    }
    
}
