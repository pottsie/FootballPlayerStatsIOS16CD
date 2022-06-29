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
