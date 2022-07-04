//
//  StatDefinitionView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/30/22.
//

import SwiftUI

//
// Display a list of statistics tracked by the program and
// there definition, as used in this app.
//

struct StatDefinitionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            List {
                // loop through the dictionary of stats and display a
                // definition for each
                ForEach(Constants.definitions.sorted(by: <), id: \.key) { stat, definition in
                    HStack(alignment: .center) {
                        Text(stat)
                            .bold()
                            .frame(width: 70.0, alignment: .leading)
                        Spacer()
                        Text(definition)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .listStyle(PlainListStyle())
            Spacer()
        }
        .font(.caption)
        .padding(.horizontal)
        .navigationTitle("Player Stat Definitions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct StatDefinitionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StatDefinitionView()
        }
    }
}
