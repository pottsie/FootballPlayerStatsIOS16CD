//
//  Double+Extensions.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/27/22.
//

import Foundation

extension Double {
    
    private var percentFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            return formatter
        }
        
        func asPercentString() -> String {
            let number = NSNumber(value: self)
            return percentFormatter.string(from: number) ?? "0.0%"
        }
        
        private var averageFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            return formatter
        }

        func asAverageString() -> String {
            let number = NSNumber(value: self)
            return averageFormatter.string(from: number) ?? "0.0"
        }
    
}
