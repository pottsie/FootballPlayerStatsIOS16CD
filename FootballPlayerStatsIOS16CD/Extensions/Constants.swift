//
//  Constants.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/24/22.
//

import Foundation

struct StatDefinitions: Identifiable {
    let id = UUID().uuidString
    let stat: String
    let definition: String
    
    // TODO: - Need to complete this list with definitions
    static let statDefinitions: [StatDefinitions] =
    [
        .init(stat: "Minutes Played", definition: "The number of minutes played during a game."),
        .init(stat: "Goal", definition: "Goal scored during a game."),
        .init(stat: "Assist", definition: "Making a pass to a teammate that results directly in a goal."),
        .init(stat: "Shot", definition: "Making a deliberate attempt to score a goal."),
        .init(stat: "Shot on Goal", definition: "A deliberate attempt to score a goal that results in a goal, or a save by the goalie."),
        .init(stat: "Dribble", definition: "Succesful 1 v 1 move against an opponent."),
        .init(stat: "Turnover", definition: "Loss of the ball due to interception, tackle, failed move."),
        .init(stat: "Header Won", definition: "A successful header, either free or contested, offensively or defensively."),
        .init(stat: "Pass Attempt", definition: "Striking the ball with the intention of it reaching an teammate directly, or by playing into space for a teammate."),
        .init(stat: "Pass Completion", definition: "A pass successfully controlled by a teammate, or a pass that should have been controlled by a teammate."),
        .init(stat: "Defensive Disruption", definition: "A successful tackle, interception, or block."),
        .init(stat: "Clearance", definition: "In the defensive third, clear the ball away, either up field or out of play."),
        .init(stat: "Shot Conversion", definition: "Percentage of shots that result in a goal."),
        .init(stat: "Shooting Accuracy", definition: "Percentage of shots that are on goal, resulting in a goal or a save by the opposing goalie."),
        .init(stat: "Passing Accuracy", definition: "Percent of passes that reach a teammate successfully.")
    ]
    
}

struct Constants {
    
    enum StatType {
        case goalsFor
        case goalsAgainst
        case minutesPlayed
        case goals
        case assists
        case shots
        case shotsOnGoal
        case dribbles
        case turnovers
        case headersWon
        case passAttempts
        case passCompletions
        case defensiveDisruptions
        case clearances
    }
    
}
