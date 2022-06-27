//
//  OffensiveStatCard.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/27/22.
//

import SwiftUI

struct OffensiveStatCard: View {
    @EnvironmentObject private var gameDM: GameDataModel
    
    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Offensive Data")
            Group {
                ProfileInformationItemView(
                    titleLeft: "Goals",
                    valueLeft: "\(gameDM.games.count)",
                    titleRight: "Avg per Game",
                    valueRight: "\(gameDM.computeRecord().0)-\(gameDM.computeRecord().1)-\(gameDM.computeRecord().2)")
                ProfileInformationItemView(
                    titleLeft: "Assists",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Shots",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Shots on Goal",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Pass Attempts",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Pass Completions",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
            }
            Group {
                ProfileInformationItemView(
                    titleLeft: "Dribbles",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Turnovers",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Headers Won",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: gameDM.computeAvgPerGame(for: .minutesPlayed))
                Divider()
                ProfileInformationItemView(
                    titleLeft: "Shot Conversion",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: nil,
                    valueRight: nil)
                ProfileInformationItemView(
                    titleLeft: "Shooting Accuracy",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: nil,
                    valueRight: nil)
                ProfileInformationItemView(
                    titleLeft: "Passing Accuracy",
                    valueLeft: "\(gameDM.computeSumFor(.minutesPlayed))",
                    titleRight: nil,
                    valueRight: nil)

            }

            Spacer()
        }
        .padding()
    }
}

struct OffensiveStatCard_Previews: PreviewProvider {
    static var previews: some View {
        OffensiveStatCard()
            .environmentObject(GameDataModel(isTesting: true))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
