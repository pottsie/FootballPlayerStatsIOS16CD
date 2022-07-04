//
//  CustomStepperView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import SwiftUI

//
// Custom stepper view for use in the game form. The following parameters
// are used:
// 1. title (required). Title for the value being collected
// 2. description (required). Text describing the value being collected
// 3. upperbound (optional). The max value allowed for this stat
// 4. lowerbound (optional). The minimum value allowed for this stat
// 5. step (optional). How much the value increases/decreases with each button push
// 6. value (required). A Binding to a variable to hold the stat value
//

struct CustomStepperView: View {
    let title: String
    let description: String
    var upperBound: Int
    var lowerBound: Int
    var step: Int
    @Binding var value: Int
    
    // conveinence initializer providing default values for description, upper bound
    // lower bound and step
    init(title: String, description: String = "", upperBound: Int = 25, lowerBound: Int = 0, step: Int = 1, value: Binding<Int>) {
        self.title = title
        self.description = description
        self.upperBound = upperBound
        self.lowerBound = lowerBound
        self.step = step
        self._value = value
    }
    
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
