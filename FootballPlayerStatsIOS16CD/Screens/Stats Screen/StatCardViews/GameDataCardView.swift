//
//  GameDataCardView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/25/22.
//

import SwiftUI

struct GameDataCardView: View {
    @EnvironmentObject private var dataVM: DataViewModel
    
    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Game Data")
            
            StatCardItemView(
                titleLeft: "Games Played",
                valueLeft: "\(dataVM.games.count)",
                titleRight: "Combined Record",
                valueRight: "\(dataVM.computeRecord().wins)-\(dataVM.computeRecord().losses)-\(dataVM.computeRecord().draws)")
            StatCardItemView(
                titleLeft: "Goals For",
                valueLeft: "\(dataVM.computeSumFor(.goalsFor))",
                titleRight: "Avg per Game",
                valueRight: "\(dataVM.computeAvgPerGame(for: .goalsFor))")
            StatCardItemView(
                titleLeft: "Goals Against",
                valueLeft: "\(dataVM.computeSumFor(.goalsAgainst))",
                titleRight: "Avg per Game",
                valueRight: "\(dataVM.computeAvgPerGame(for: .goalsAgainst))")

            Divider()

            StatCardItemView(
                titleLeft: "Minutes Played",
                valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                titleRight: "Avg per Game",
                valueRight: "\(dataVM.computeAvgPerGame(for: .minutesPlayed))")

            Spacer()
        }
        .padding()
    }
}

struct GameDataCardView_Previews: PreviewProvider {
    static var previews: some View {
        GameDataCardView()
            .environmentObject(DataViewModel(controller: MockedDataController()))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
