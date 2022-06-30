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
                StatCardItemView(
                    titleLeft: "Dribbles",
                    valueLeft: "\(dataVM.computeSumFor(.dribbles))",
                    titleRight: "Avg per Games",
                    valueRight: "\(dataVM.computeAvgPerGame(for: .dribbles))")
                StatCardItemView(
                    titleLeft: "Turnovers",
                    valueLeft: "\(dataVM.computeSumFor(.turnovers))",
                    titleRight: "Avg per Games",
                    valueRight: "\(dataVM.computeAvgPerGame(for: .turnovers))")
                StatCardItemView(
                    titleLeft: "Headers Won",
                    valueLeft: "\(dataVM.computeSumFor(.headersWon))",
                    titleRight: "Avg per Games",
                    valueRight: "\(dataVM.computeAvgPerGame(for: .headersWon))")

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
