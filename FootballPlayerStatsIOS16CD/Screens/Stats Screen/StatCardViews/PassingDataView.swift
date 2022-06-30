//
//  PassingDataView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/29/22.
//

import SwiftUI

struct PassingDataView: View {
    @EnvironmentObject private var dataVM: DataViewModel
    var body: some View {
        VStack(spacing: 10.0) {
            StatCardTitleView(title: "Passing Data")
            
            StatCardItemView(
                titleLeft: "Assists",
                valueLeft: "\(dataVM.computeSumFor(.assists))",
                titleRight: "Avg per Game",
                valueRight: "\(dataVM.computeAvgPerGame(for: .assists))")
            StatCardItemView(
                titleLeft: "Pass Attempts",
                valueLeft: "\(dataVM.computeSumFor(.passAttempts))",
                titleRight: "Avg per Game",
                valueRight: "\(dataVM.computeAvgPerGame(for: .passAttempts))")
            StatCardItemView(
                titleLeft: "Pass Completions",
                valueLeft: "\(dataVM.computeSumFor(.passCompletions))",
                titleRight: "Avg per Game",
                valueRight: "\(dataVM.computeAvgPerGame(for: .passCompletions))")
            
            Divider()
            
            StatCardItemView(
                titleLeft: "Passing Accuracy", 
                valueLeft: dataVM.computePercentageFor(numerator: .passCompletions, denominator: .passAttempts), 
                titleRight: nil, 
                valueRight: nil)
            
            Spacer()
        }
        .padding()
    }
}

struct PassingDataView_Previews: PreviewProvider {
    static var previews: some View {
        PassingDataView()
            .environmentObject(DataViewModel(controller: MockedDataController()))
    }
}
