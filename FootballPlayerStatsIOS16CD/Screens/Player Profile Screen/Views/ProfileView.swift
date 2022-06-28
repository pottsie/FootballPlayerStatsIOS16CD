//
//  ProfileView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/23/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var dataVM: DataViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 2.0) {
                ProfileImageView(size: 200)
                    .padding(.vertical)
//                Text("#4 \(dataVM.player.fullName)")
//                    .foregroundColor(Color.theme.primaryText)
//                    .font(.title)
//                    .fontWeight(.semibold)
//                    .lineLimit(2)
//                    .multilineTextAlignment(.center)
//                //                Text("#4 / #27")
//                Text("DOB: \(dataVM.player.formattedDateOfBirth)")
//                    .italic()
//                    .foregroundColor(.secondary)
                Text("Height: 68 in")
                    .italic()
                    .foregroundColor(.secondary)
            }
            .padding(.bottom)
            VStack(spacing: 10.0) {
                ProfileInformationItemView(titleLeft: "Club Team", valueLeft: "SCAA Rangers 07B", titleRight: "Position", valueRight: "CDM")
                ProfileInformationItemView(titleLeft: "HS Team", valueLeft: "South County", titleRight: "Position", valueRight: "CDM")
                ProfileInformationItemView(titleLeft: "Email", valueLeft: "nfl_noah@icloud.com", titleRight: "Cell", valueRight: "703-678-9797")
                
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
            .environmentObject(DataViewModel(controller: MockedDataController()))
    }
}
