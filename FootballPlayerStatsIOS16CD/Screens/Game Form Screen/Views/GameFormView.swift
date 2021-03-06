//
//  GameFormView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import SwiftUI

//
// This form view and the update/add functionality are based on the code developed
// and covered by Stewart Lynch on YouTube.
//
// The form is divided into 4 sections;
// 1. General game data
// 2. Player data at the game level
// 3. Player offensive oriented data
// 4. Player defensive oriented data
//

struct GameFormView: View {
    @StateObject var formVM: GameFormViewModel
    @EnvironmentObject private var dataVM: DataViewModel
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
            .environmentObject(DataViewModel(controller: MockedDataController()))
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
            CustomStepperView(title: "Our Score", value: $formVM.newOurScore)
            CustomStepperView(title: "Opponent Score", value: $formVM.newOpponentScore)
            CustomStepperView(title: "Game Length", description: "duration in minutes", upperBound: 90, lowerBound: 40, step: 10, value: $formVM.newLengthOfGame)
        } header: {
            Text("Game Data")
        }
    }
    
    var playerGameData: some View {
        Section {
            CustomStepperView(title: "Minutes Played", description: "how many minutes were played", upperBound: formVM.newLengthOfGame, lowerBound: 0, step: 1, value: $formVM.newMinutesPlayed)
            Toggle(isOn: $formVM.newHighlightGame) {
                Text("Highlight Game")
                    .font(.headline)
            }
            TextEditor(text: $formVM.newNotes)
                .font(.headline)
                .foregroundColor(.secondary)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
        } header: {
            Text("Player Game Data")
        }
    }
    
    var playerOffensiveData: some View {
        Section {
            CustomStepperView(title: "Goals", upperBound: formVM.newOurScore, lowerBound: 0, step: 1, value: $formVM.newGoals)
            CustomStepperView(title: "Assists", upperBound: formVM.newOurScore - formVM.newGoals, lowerBound: 0, step: 1, value: $formVM.newAssists)
            CustomStepperView(title: "Shots", description: "any attempted shot", value: $formVM.newShots)
            CustomStepperView(title: "Shots on Goal", description: "shot resulting in a goal or save", upperBound: formVM.newShots, lowerBound: 0, step: 1, value: $formVM.newShotsOnGoal)
            CustomStepperView(title: "Dribbles", description: "beating player 1 v 1", value: $formVM.newDribbles)
            CustomStepperView(title: "Turnovers", description: "losing ball to opponent", value: $formVM.newTurnovers)
            CustomStepperView(title: "Headers Won", value: $formVM.newHeadersWon)
            CustomStepperView(title: "Pass Attempts", value: $formVM.newPassAttempts)
            CustomStepperView(title: "Pass Completions", description: "pass reached teammate", upperBound: formVM.newPassAttempts, lowerBound: 0, step: 1, value: $formVM.newPassCompletions)
        } header: {
            Text("Player Offensive Data")
        }
    }
    
    var playerDefensiveData: some View {
        Section {
            CustomStepperView(title: "Defensive Disruptions", description: "tackles, blocks, interceptions", value: $formVM.newDefensiveDisruptions)
            CustomStepperView(title: "Clearances", description: "clear from defensive third", value: $formVM.newClearances)
        } header: {
            Text("Player Defensive Data")
        }
    }
    
    
    // MARK: - functions
    private func addGame() {
        dataVM.addGame(opponent: formVM.newOpponent,
                       dateOfGame: formVM.newDateOfGame,
                       gameType: formVM.newGameType,
                       ourScore: formVM.newOurScore,
                       opponentScore: formVM.newOpponentScore,
                       lengthOfGame: formVM.newLengthOfGame,
                       highlightGame: formVM.newHighlightGame,
                       notes: formVM.newNotes,
                       minutesPlayed: formVM.newMinutesPlayed,
                       goals: formVM.newGoals,
                       assists: formVM.newAssists,
                       shots: formVM.newShots,
                       shotsOnGoal: formVM.newShotsOnGoal,
                       dribbles: formVM.newDribbles,
                       turnovers: formVM.newTurnovers,
                       headersWon: formVM.newHeadersWon,
                       passAttempts: formVM.newPassAttempts,
                       passCompletions: formVM.newPassCompletions,
                       defensiveDisruptions: formVM.newDefensiveDisruptions,
                       clearances: formVM.newClearances)
    }
    
    private func updateGame() {
        dataVM.updateGame(id: formVM.id!,
                          opponent: formVM.newOpponent,
                          dateOfGame: formVM.newDateOfGame,
                          gameType: formVM.newGameType,
                          ourScore: formVM.newOurScore,
                          opponentScore: formVM.newOpponentScore,
                          lengthOfGame: formVM.newLengthOfGame,
                          highlightGame: formVM.newHighlightGame,
                          notes: formVM.newNotes,
                          minutesPlayed: formVM.newMinutesPlayed,
                          goals: formVM.newGoals,
                          assists: formVM.newAssists,
                          shots: formVM.newShots,
                          shotsOnGoal: formVM.newShotsOnGoal,
                          dribbles: formVM.newDribbles,
                          turnovers: formVM.newTurnovers,
                          headersWon: formVM.newHeadersWon,
                          passAttempts: formVM.newPassAttempts,
                          passCompletions: formVM.newPassCompletions,
                          defensiveDisruptions: formVM.newDefensiveDisruptions,
                          clearances: formVM.newClearances)
        
    }
}

