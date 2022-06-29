//
//  FootballPlayerStatsIOS16CDApp.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

@main
struct FootballPlayerStatsIOS16CDApp: App {
    // change the value of the controller from Mocked... to Production... depending
    // on desired testing
    @StateObject private var dataVM = DataViewModel(controller: MockedDataController())
//    @StateObject private var dataVM = DataViewModel(controller: ProductionDataController())

    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(dataVM)
        }
    }
}
