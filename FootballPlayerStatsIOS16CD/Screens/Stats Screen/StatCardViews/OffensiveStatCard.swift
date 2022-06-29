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
                    valueLeft: "5",
                    titleRight: "Avg per Games",
                    valueRight: "1.2")
                StatCardItemView(
                    titleLeft: "Turnovers",
                    valueLeft: "5",
                    titleRight: "Avg per Games",
                    valueRight: "1.2")
                StatCardItemView(
                    titleLeft: "Headers Won",
                    valueLeft: "5",
                    titleRight: "Avg per Games",
                    valueRight: "1.2")

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
