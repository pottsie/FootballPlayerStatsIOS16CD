//
//  CustomStepperView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import SwiftUI

struct CustomStepperView: View {
    let title: String
    let description: String
    var upperBound: Int = 25
    var lowerBound: Int = 0
    var step: Int = 1
    @Binding var value: Int
    
    var body: some View {
        Stepper(value: $value, in: lowerBound...upperBound, step: step) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(description)
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                Spacer()
                Text("\(value)")
            }
        }
    }
}

struct CustomStepperView_Previews: PreviewProvider {
    static var previews: some View {
        CustomStepperView(title: "Shots on Goal", description: "shots goalie had to save", value: .constant(2))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
