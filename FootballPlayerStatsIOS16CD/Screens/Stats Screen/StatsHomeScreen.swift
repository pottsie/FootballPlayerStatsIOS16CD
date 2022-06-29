//
//  StatsHomeScreen.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/25/22.
//

import SwiftUI

struct StatsHomeScreen: View {
    @EnvironmentObject private var dataVM: DataViewModel
    
    var body: some View {
        NavigationStack {
            TabView {
                GameDataCardView()
                ScoringDataCard()
                OffensiveStatCard()
                PassingDataView()
                DefensiveStatCard()
            }
            .tabViewStyle(.page)
            .navigationTitle("Players Statistics")
        }
    }
}

struct StatsHomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatsHomeScreen()
            .environmentObject(DataViewModel(controller: MockedDataController()))
    }
}
