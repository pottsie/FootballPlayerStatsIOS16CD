//
//  OffensiveStatCard.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/27/22.
//

import SwiftUI

struct OffensiveStatCard: View {
    @EnvironmentObject private var dataVM: DataViewModel
    
    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Offensive Data")
            Group {
                ProfileInformationItemView(
                    titleLeft: "Goals",
                    valueLeft: "\(dataVM.games.count)",
                    titleRight: "Avg per Game",
                    valueRight: "\(dataVM.computeRecord().0)-\(dataVM.computeRecord().1)-\(dataVM.computeRecord().2)")
                ProfileInformationItemView(
                    titleLeft: "Assists",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Shots",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Shots on Goal",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Pass Attempts",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Pass Completions",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
            }
            Group {
                ProfileInformationItemView(
                    titleLeft: "Dribbles",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Turnovers",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                ProfileInformationItemView(
                    titleLeft: "Headers Won",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
                Divider()
                ProfileInformationItemView(
                    titleLeft: "Shot Conversion",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: nil,
                    valueRight: nil)
                ProfileInformationItemView(
                    titleLeft: "Shooting Accuracy",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                    titleRight: nil,
                    valueRight: nil)
                ProfileInformationItemView(
                    titleLeft: "Passing Accuracy",
                    valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
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
            .environmentObject(DataViewModel(controller: MockedDataController()))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
