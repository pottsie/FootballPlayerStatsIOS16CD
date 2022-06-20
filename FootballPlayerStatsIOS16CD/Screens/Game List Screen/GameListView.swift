//
//  GameListView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject private var gameDM: GameDataModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(gameDM.games) { game in
                    GameListItemView(game: game)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Games Played")
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
            .environmentObject(GameDataModel(isTesting: true))
    }
}
