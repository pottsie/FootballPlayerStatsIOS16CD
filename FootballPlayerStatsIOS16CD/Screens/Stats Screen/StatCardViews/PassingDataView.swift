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
                valueLeft: "1",
                titleRight: "Avg per Game",
                valueRight: "0.32")
            StatCardItemView(
                titleLeft: "Pass Attempts",
                valueLeft: "23",
                titleRight: "Avg per Game",
                valueRight: "11.4")
            StatCardItemView(
                titleLeft: "Pass Completions",
                valueLeft: "19",
                titleRight: "Avg per Game",
                valueRight: "8.5")
            
            Divider()
            
            StatCardItemView(
                titleLeft: "Passing Accuracy", 
                valueLeft: "78.4%", 
                titleRight: nil, 
                valueRight: nil)
            
            Spacer()
        }
    }
}

struct PassingDataView_Previews: PreviewProvider {
    static var previews: some View {
        PassingDataView()
            .environmentObject(DataViewModel(controller: MockedDataController()))
    }
}
