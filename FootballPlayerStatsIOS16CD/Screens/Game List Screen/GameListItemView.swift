//
//  GameListItemView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

struct GameListItemView: View {
    let game: GameEntity
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(.blue)
                .opacity(game.highlightGame ? 1.0 : 0.0)
            VStack(alignment: .leading) {
                Text(game.opponent)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                Text(game.dateOfGame)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                gameType
            }
            Spacer()
            Text(game.gameResult)
                .font(.headline)
        }
    }
}

struct GameListItemView_Previews: PreviewProvider {
    static var previews: some View {
        GameListItemView(game: GameDataModel(isTesting: true).games.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

extension GameListItemView {
    var gameType: some View {
        switch game.gameType {
        case .club:
            return Text("Club")
                .font(.subheadline)
                .foregroundColor(.secondary)
        case .highSchool:
            return Text("High School")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
