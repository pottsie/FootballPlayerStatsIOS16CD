//
//  GameDataCardView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/25/22.
//

import SwiftUI

struct GameDataCardView: View {
    @EnvironmentObject private var gameDM: GameDataModel
    
    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Game Data")
            ProfileInformationItemView(
                titleLeft: "Games Played",
                valueLeft: "\(gameDM.games.count)",
                titleRight: "Combined Record",
                valueRight: "\(gameDM.computeRecord().0)-\(gameDM.computeRecord().1)-\(gameDM.computeRecord().2)")
            ProfileInformationItemView(
                titleLeft: "Minutes Played",
                valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))", 
                titleRight: "Avg per Game",
                valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
            Spacer()
        }
//        .padding(.vertical)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.mint.opacity(0.15))
//        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.secondary, lineWidth: 2))
        .padding()
    }
}

struct GameDataCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameDataCardView()
            .environmentObject(GameDataModel(isTesting: true))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
