//
//  GameListView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject private var gameDM: GameDataModel
    @State var formType: FormType?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(gameDM.games) { game in
                    GameListItemView(game: game)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                gameDM.deleteGame(game)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                withAnimation {
                                    gameDM.toggleHighlightFlag(for: game)
                                }
                            } label: {
                                Label(game.highlightGame ? "Unflag" : "Flag", systemImage: game.highlightGame ? "star.slash.fill" : "star.fill")
                            }
                            .tint(.blue)
                            Button {
                                // TODO: - functionality related to editing a game
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.green)
                        }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Games Played")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Label("New Game", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $formType) { $0 }
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
            .environmentObject(GameDataModel(isTesting: true))
    }
}
