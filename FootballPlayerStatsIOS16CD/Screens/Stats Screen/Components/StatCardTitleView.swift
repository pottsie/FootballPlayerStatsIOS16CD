//
//  StatCardTitleView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/25/22.
//

import SwiftUI

struct StatCardTitleView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title.uppercased())
                .font(.title3)
                .foregroundColor(Color.theme.primaryText)
                .fontWeight(.heavy)
            Spacer()
        }
    }
}

struct StatCardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        StatCardTitleView(title: "Game Data Card")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
