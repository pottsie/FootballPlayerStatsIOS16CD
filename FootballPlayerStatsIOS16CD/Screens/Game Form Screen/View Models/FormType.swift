//
//  FormType.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/21/22.
//

import Foundation
import SwiftUI

enum FormType: Identifiable, View {
    case new
    case update(GameEntity)
    
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return GameFormView(formVM: GameFormViewModel())
        case .update(let game):
            return GameFormView(formVM: GameFormViewModel(game))
        }
    }
}
