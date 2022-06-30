//
//  StatDefinitionView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/30/22.
//

import SwiftUI

struct StatDefinitionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            List {
                ForEach(StatDefinitions.statDefinitions) { definition in
                    HStack(alignment: .center) {
                        Text(definition.stat)
                            .bold()
                            .frame(width: 70.0, alignment: .leading)
                        Spacer()
                        Text(definition.definition)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .listStyle(PlainListStyle())
            Spacer()
        }
        .font(.caption)
        .padding(.horizontal)
        .navigationTitle("Stat Definitions")
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