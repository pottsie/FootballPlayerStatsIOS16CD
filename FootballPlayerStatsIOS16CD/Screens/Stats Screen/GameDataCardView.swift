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
            ProfileInformationItemView(
                titleLeft: "Games Played",
                valueLeft: "\(dataVM.games.count)",
                titleRight: "Combined Record",
                valueRight: "\(dataVM.computeRecord().0)-\(dataVM.computeRecord().1)-\(dataVM.computeRecord().2)")
            ProfileInformationItemView(
                titleLeft: "Minutes Played",
                valueLeft: "\(dataVM.computeSumFor(.minutesPlayed))",
                titleRight: "Avg per Game",
                valueRight: dataVM.computeAvgPerGame(for: .minutesPlayed))
            ProfileInformationItemView(
                titleLeft: "Goals For",
                valueLeft: "\(dataVM.computeSumFor(.goalsFor))",
                titleRight: "Avg per Game",
                valueRight: dataVM.computeAvgPerGame(for: .goalsFor))
            ProfileInformationItemView(
                titleLeft: "Goals Against",
                valueLeft: "\(dataVM.computeSumFor(.goalsAgainst))",
                titleRight: "Avg per Game",
                valueRight: dataVM.computeAvgPerGame(for: .goalsAgainst))

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
