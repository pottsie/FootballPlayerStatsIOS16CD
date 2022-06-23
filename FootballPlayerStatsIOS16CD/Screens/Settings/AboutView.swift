//
//  AboutView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/22/22.
//

import SwiftUI
import UIKit

struct AboutView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            Spacer()
            Text("Football Player Stats")
                .font(.title)
                .fontWeight(.heavy)
            Text("Version " + (UIApplication.appVersion ?? "N/A"))
            Text("Build " + (UIApplication.appBuild ?? "N/A"))
            HStack {
                Text("Developed By:")
                Text("Soccer Player Stats, LLC")
            }
            .padding()
            Text("www.soccerplayerstats.com")
            
            Spacer()
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
