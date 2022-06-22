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
    
}
