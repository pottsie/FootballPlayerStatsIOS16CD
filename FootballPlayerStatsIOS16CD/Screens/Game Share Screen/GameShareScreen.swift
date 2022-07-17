//
//  GameShareScreen.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 7/6/22.
//

import SwiftUI

//
// Display data for a single game, in a format the can be shared
// to twitter or other social services via the share sheet.
//

struct GameShareScreen: View {
//    let gameToShare: GameEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Opponent")
            Text("July 6, 2022")
        }
    }
}

struct GameShareScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameShareScreen()
    }
}
