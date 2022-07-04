//
//  HomeScreen.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

//
// Home view for the app. There are 4 tabs, for the game list, statistics views,
// player profile view, and the settings view. The default view is the game list.
//

struct HomeScreen: View {
    @EnvironmentObject private var dataVM: DataViewModel
    
    var body: some View {
        // the tab view is the root of the app
        TabView {
            GameListView()
                .tabItem {
                    Label("Game List", systemImage: "list.bullet")
                }
            StatsHomeScreen()
                .tabItem {
                    Label("Player Stats", systemImage: "chart.bar")
                }
            ProfileView()
                .tabItem {
                    Label("Player Profile", systemImage: "person.crop.square")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(DataViewModel(controller: MockedDataController()))
    }
}
