//
//  GameEntity+Extensions.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import Foundation

enum GameType: Int32 {
    case club = 0
    case highSchool = 1
}

extension GameEntity {
    
    // MARK: - computed properties
    
    var opponent: String {
        opponent_ ?? "No name"
    }
    
    // compute the game winner and return a string with result and score
    var gameResult: String {
        if ourScore_ > opponentScore_ {
            return "W \(ourScore_)-\(opponentScore_)"
        } else if ourScore_ < opponentScore_ {
            return "L \(ourScore_)-\(opponentScore_)"
        } else {
            return "D \(ourScore_)-\(opponentScore_)"
        }
    }
    
    var dateOfGame: String {
        dateOfGame_?.formatted(date: .long, time: .omitted) ?? "No date"
    }
    
    // convert the gameType to/from enum to an Int32 (for Core Data)
    var gameType: GameType {
        get {
            return GameType(rawValue: self.gameType_)!
        }
        set {
            self.gameType_ = newValue.rawValue
        }
    }
        
}
