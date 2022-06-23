//
//  GameListView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

/*
 * This is the default view when the app launches, and shows a list of all games played, including
 * opponent, date of game, length of game, game type (club/high school), score, and result. From this
 * view the user can highlight, edit, delete, or create a new game.
 */

struct GameListView: View {
    @EnvironmentObject private var gameDM: GameDataModel
    @State var formType: FormType?
    @State private var animationAmount = 1.0
    
    var body: some View {
        NavigationStack {
            VStack {
                if gameDM.games.isEmpty {
                    noGamesView
                } else {
                    gameList
                }
            }
            .navigationTitle("Games Played")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if gameDM.games.isEmpty {
                        flashingButton
                    } else {
                        Button {
                            formType = .new
                        } label: {
                            Label("New Game", systemImage: "plus")
                        }
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

// MARK: - Extensions
extension GameListView {
    
    // If there are games array is not empty, then show the list of games
    var gameList: some View {
        List {
            ForEach(gameDM.games) { game in
                GameListItemView(game: game)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            withAnimation {
                                gameDM.deleteGame(game)
                            }
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
                            formType = .update(game)
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.green)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    // if the games array is empty, then display a welcome message, and highlight the add game button
    var noGamesView: some View {
        return Group {
            Spacer()
            ZStack {
                Text("Add a Game to Start")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            Spacer()
            Spacer()
        }
    }
    
    // create a flashing circle around the add game button
    var flashingButton: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 4.0).foregroundColor(.red)
                    .frame(width: 25, height: 25)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: animationAmount)
                    .offset(x: 4)
                Button {
                    formType = .new
                } label: {
                    Label("Add Game", systemImage: "plus")
                }
            }
            .onAppear {
                animationAmount = 1.5
            }
        }
}
