//
//  Constants.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/24/22.
//

import Foundation

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
    
    static let definitions: [String: String] =
    [
        "Minutes Played": "The number of minutes played during a game.",
        "Goal": "Goal scored during a game.",
        "Assist": "Making a pass to a teammate that results directly in a goal.",
        "Shot": "Making a deliberate attempt to score a goal.",
        "Shot on Goal": "A deliberate attempt to score a goal that results in a goal, or a save by the goalie.",
        "Dribble": "Succesful 1 v 1 move against an opponent.",
        "Turnover": "Loss of the ball due to interception, tackle, failed move.",
        "Header Won": "A successful header, either free or contested, offensively or defensively.",
        "Pass Attempt": "Striking the ball with the intention of it reaching an teammate directly, or by playing into space for a teammate.",
        "Pass Completion": "A pass successfully controlled by a teammate, or a pass that should have been controlled by a teammate.",
        "Defensive Disruption": "A successful tackle, interception, or block.",
        "Clearance": "In the defensive third, clear the ball away, either up field or out of play.",
        "Shot Conversion": "Percentage of shots that result in a goal.",
        "Shooting Accuracy": "Percentage of shots that are on goal, resulting in a goal or a save by the opposing goalie.",
        "Passing Accuracy": "Percent of passes that reach a teammate successfully."
    ]
    
}
