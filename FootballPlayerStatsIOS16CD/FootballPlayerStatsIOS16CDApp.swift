//
//  FootballPlayerStatsIOS16CDApp.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

@main
struct FootballPlayerStatsIOS16CDApp: App {
    @StateObject private var gameDM = GameDataModel(isTesting: true)
    
    var body: some Scene {
        WindowGroup {
            GameListView()
                .environmentObject(gameDM)
        }
    }
}
