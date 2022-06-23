//
//  SettingsView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/22/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
            NavigationView {
                Form {
                    Section {
                        NavigationLink {
                            AboutView()
                        } label: {
                            Label("About", systemImage: "info.circle")
                        }
                    } header: {
                        Text("General")
                    }
                    Section {
                        Button {
                            // TODO: - Function for importing JSON data
                            print("Import game data from json file")
                        } label: {
                            Label("Import Game Data (JSON)", systemImage: "arrow.down.circle")
                        }
                        Button {
                            // TODO: - Function for exporting JSON data
                        } label: {
                            Label("Export Game Data (JSON)", systemImage: "arrow.up.circle")
                        }
                        Button {
                            // TODO: - Function for deleting data
                        } label: {
                            Label("Remove Game Data", systemImage: "x.circle")
                        }
                    } header: {
                        Text("Manage Game Data")
                    }
                    Section {
                        Button {
                            // TODO: - Function for deleting player profile data
                        } label: {
                            Label("Remove Player Data", systemImage: "x.circle")
                        }
                    } header: {
                        Text("Manage Player Data")
                    }

                    Section {
                        Button {
                            // TODO: - Function for emailing the developer
                        } label: {
                            Label("Send Email", systemImage: "mail")
                        }
                    } header: {
                        Text("Contact Developer")
                    }
                }
                .navigationTitle("Settings")
            }
        }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
