//
//  PlayerEntity+Extensions.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/23/22.
//

import Foundation

extension PlayerEntity {
    
    var firstName: String {
        firstName_ ?? "No first name"
    }
    
    var lastName: String {
        lastName_ ?? "No last name"
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    var formattedDateOfBirth: String {
        dateOfBirth_?.formatted(date: .long, time: .omitted) ?? "No DoB"
    }
    
}
