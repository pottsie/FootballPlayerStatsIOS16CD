//
//  ProfileInformationItemView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/23/22.
//

import SwiftUI

struct ProfileInformationItemView: View {
    let titleLeft: String?
    let valueLeft: String?
    let titleRight: String?
    let valueRight: String?
    
    var body: some View {
        HStack {
            if let titleLeft = titleLeft, let valueLeft = valueLeft {
                VStack(alignment: .leading) {
                    Text(titleLeft.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(valueLeft)
                        .foregroundColor(Color.theme.primaryText)
                        .font(.headline)
                }
            }
            Spacer()
            if let titleRight = titleRight, let valueRight = valueRight {
                VStack(alignment: .trailing) {
                    Text(titleRight.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(valueRight)
                        .foregroundColor(Color.theme.primaryText)
                        .font(.headline)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProfileInformationItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileInformationItemView(titleLeft: "Club Team", valueLeft: "SCAA Rangers 07B", titleRight: "Position", valueRight: "CDM")
            ProfileInformationItemView(titleLeft: "Club Team", valueLeft: "SCAA Rangers 07B", titleRight: nil, valueRight: nil)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
