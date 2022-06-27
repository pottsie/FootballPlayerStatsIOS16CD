//
//  StatsHomeScreen.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/25/22.
//

import SwiftUI

struct StatsHomeScreen: View {
    @EnvironmentObject private var gameDM: GameDataModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                GameDataCardView()
            }
            .padding()
            .navigationTitle("Players Statistics")
        }
    }
}

struct StatsHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatsHomeScreen()
            .environmentObject(GameDataModel(isTesting: true))
    }
}
