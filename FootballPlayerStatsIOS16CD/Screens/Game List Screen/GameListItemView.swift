//
//  GameListItemView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/20/22.
//

import SwiftUI

//
// View shows the game meta data for use in the game list screen
//

struct GameListItemView: View {
    @EnvironmentObject private var dataVM: DataViewModel
    let game: GameEntity
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(Color.theme.primaryText)
                .opacity(game.highlightGame ? 1.0 : 0.0)
            VStack(alignment: .leading) {
                Text(game.opponent)
                    .foregroundColor(Color.theme.primaryText)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                Text(game.dateOfGame)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                gameType
            }
            Spacer()
            game.gameResult
                .font(.headline)
        }
    }
}

struct GameListItemView_Previews: PreviewProvider {
    static var previews: some View {
        GameListItemView(game: DataViewModel(controller: MockedDataController()).games.first!)
            .environmentObject(DataViewModel(controller: MockedDataController()))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

// MARK: - Extensions
extension GameListItemView {
    
    // use the game type enum to switch between views for displaying the type
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
