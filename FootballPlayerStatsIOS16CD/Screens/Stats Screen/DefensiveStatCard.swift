//
//  DefensiveStatCard.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/27/22.
//

import SwiftUI

struct DefensiveStatCard: View {
    @EnvironmentObject private var dataVM: DataViewModel
    
    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Defensive Data")
            Group {
                ProfileInformationItemView(
                    titleLeft: "Defensive Disruptions",
                    valueLeft: "\(dataVM.computeSumFor(.defensiveDisruptions))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .defensiveDisruptions))
                ProfileInformationItemView(
                    titleLeft: "Clearances",
                    valueLeft: "\(dataVM.computeSumFor(.clearances))",
                    titleRight: "Avg per Game",
                    valueRight: dataVM.computeAvgPerGame(for: .clearances))
            }
            Spacer()
        }
        .padding()
    }
}

struct DefensiveStatCard_Previews: PreviewProvider {
    static var previews: some View {
        DefensiveStatCard()
            .environmentObject(DataViewModel(controller: MockedDataController()))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
