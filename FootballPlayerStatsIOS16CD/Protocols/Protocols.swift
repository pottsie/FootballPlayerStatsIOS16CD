//
//  Protocols.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/28/22.
//

import CoreData
import Foundation

protocol GameDataControllerProtocol {
    func fetchGames() -> [GameEntity]
    func deleteGame(_ game: GameEntity)
    func addGame() -> GameEntity
    func updateGame()
    func saveGames()
}
