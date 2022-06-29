//
//  ScoringDataCard.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/29/22.
//

import SwiftUI

struct ScoringDataCard: View {
    @EnvironmentObject private var dataVM: DataViewModel

    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Scoring Data")
            StatCardItemView(titleLeft: "Goals", valueLeft: "\(dataVM.computeSumFor(.goals))", titleRight: "Avg per Game", valueRight: "\(dataVM.computeAvgPerGame(for: .goals))")
            StatCardItemView(titleLeft: "Shots", valueLeft: "\(dataVM.computeSumFor(.shots))", titleRight: "Avg per Game", valueRight: "\(dataVM.computeAvgPerGame(for: .shots))")
            StatCardItemView(titleLeft: "Shots on Goal", valueLeft: "\(dataVM.computeSumFor(.shotsOnGoal))", titleRight: "Avg per Game", valueRight: "\(dataVM.computeAvgPerGame(for: .shotsOnGoal))")
            Divider()
            StatCardItemView(titleLeft: "Shot Conversion", valueLeft: "12.4%", titleRight: nil, valueRight: nil)
            StatCardItemView(titleLeft: "Shooting Accuracy", valueLeft: "33.3%", titleRight: nil, valueRight: nil)

            Spacer()
        }
        .padding()
    }
}

struct ScoringDataCard_Previews: PreviewProvider {
    static var previews: some View {
        ScoringDataCard()
            .environmentObject(DataViewModel(controller: MockedDataController()))
    }
}
