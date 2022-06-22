//
//  GameFormView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import SwiftUI

struct GameFormView: View {
    @StateObject var formVM: GameFormViewModel
    @EnvironmentObject private var gameDM: GameDataModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                gameData
                playerGameData
                playerOffensiveData
                playerDefensiveData
            }
            .navigationTitle(formVM.updating ? "Update Game" : "New Game")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formVM.updating ? updateGame() : addGame()
                        dismiss()
                    } label: {
                        Text(formVM.updating ? "Update" : "Add")
                    }
                    .disabled(formVM.newOpponent.isEmpty)
                }
            }
        }
    }
}

struct GameFormView_Previews: PreviewProvider {
    static var previews: some View {
        GameFormView(formVM: GameFormViewModel())
            .environmentObject(GameDataModel(isTesting: true))
    }
}

extension GameFormView {
    
    // MARK: - computed variables
    var gameData: some View {
        Section {
            TextField("Opponent", text: $formVM.newOpponent)
                .font(.headline)
            DatePicker(selection: $formVM.newDateOfGame,
                       in: ...Date(),
                       displayedComponents: .date) {
                Text("Date of Game")
            }
                       .font(.headline)
            Picker("Game Type", selection: $formVM.newGameType) {
                Text("Club").tag(GameType.club)
                    .font(.headline)
                Text("High School").tag(GameType.highSchool)
                    .font(.headline)
            }
            .pickerStyle(.segmented)
            CustomStepperView(title: "Our Score", description: "", value: $formVM.newOurScore)
            CustomStepperView(title: "Opponent Score", description: "", value: $formVM.newOpponentScore)
            CustomStepperView(title: "Game Length", description: "duration in minutes", upperBound: 90, lowerBound: 40, step: 10, value: $formVM.newLengthOfGame)
        } header: {
            Text("Game Data")
        }
    }
    
    var playerGameData: some View {
        Section {
            //
        } header: {
            Text("Player Game Data")
        }
    }
    
    var playerOffensiveData: some View {
        Section {
            //
        } header: {
            Text("Player Offensive Data")
        }
    }
    
    var playerDefensiveData: some View {
        Section {
            //
        } header: {
            Text("Player Defensive Data")
        }
    }
    
    
    // MARK: - functions
    private func addGame() {
        gameDM.addGame(opponent: formVM.newOpponent,
                       dateOfGame: formVM.newDateOfGame,
                       gameType: formVM.newGameType,
                       ourScore: formVM.newOurScore,
                       opponentScore: formVM.newOpponentScore,
                       lengthOfGame: formVM.newLengthOfGame)
    }
    
    private func updateGame() {
        gameDM.updateGame(id: formVM.id!,
                          opponent: formVM.newOpponent,
                          dateOfGame: formVM.newDateOfGame,
                          gameType: formVM.newGameType,
                          ourScore: formVM.newOurScore,
                          opponentScore: formVM.newOpponentScore,
                          lengthOfGame: formVM.newLengthOfGame)
        
    }
}

