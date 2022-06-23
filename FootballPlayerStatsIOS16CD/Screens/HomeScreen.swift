//
//  HomeScreen.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var gameDM: GameDataModel
    
    var body: some View {
        // the tab view is the root of the app
        TabView {
            GameListView()
                .tabItem {
                    Label("Game List", systemImage: "list.bullet")
                }
            Text("Statistical View")
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
            .environmentObject(GameDataModel(isTesting: true))
    }
}
