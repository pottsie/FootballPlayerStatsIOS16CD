//
//  ProfileView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/23/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var gameDM: GameDataModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5.0) {
                ProfileImageView(size: 200)
                    .padding(.vertical)
                Text(gameDM.player.fullName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
//                Text("#4 / #27")
                Text(gameDM.player.formattedDateOfBirth)
                HStack {
                    Text("SCAA Rangers 07")
                    Spacer()
                    Text("CDM")
                }
                HStack {
                    Text("South County HS")
                    Spacer()
                    Text("CDM")
                }
                HStack {
                    Text("nfl_noah@icloud.com")
                    Spacer()
                    Text("703-678-9797")
                }

                Spacer()
            }
            .navigationTitle("Player Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Label("Edit Profile", systemImage: "pencil")
                    }

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(GameDataModel(isTesting: true))
    }
}
