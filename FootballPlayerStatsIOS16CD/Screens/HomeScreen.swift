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
        TabView {
            GameListView()
                .tabItem {
                    Label("Game List", systemImage: "list.bullet")
                }
            Text("Statistical View")
                .tabItem {
                    Label("Player Stats", systemImage: "chart.bar")
                }
            Text("Player Profile")
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
