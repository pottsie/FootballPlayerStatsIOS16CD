//
//  FootballPlayerStatsIOS16CDApp.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

@main
struct FootballPlayerStatsIOS16CDApp: App {
    // change the value isTesting to use mock data (true) or on device storage (false)
//    @StateObject private var gameDM = GameDataModel(isTesting: true)
    @StateObject private var dataVM = DataViewModel(controller: MockedDataController())
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(dataVM)
        }
    }
}
